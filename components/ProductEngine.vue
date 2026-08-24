<script setup lang="ts">
const canvas = ref<HTMLCanvasElement>()
const canvasReady = ref(false)
const fallbackVisible = ref(false)
const router = useRouter()
let dispose: (() => void) | undefined

onUnmounted(() => dispose?.())

onMounted(async () => {
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)')

  if (
    !canvas.value ||
    !window.WebGLRenderingContext ||
    !window.matchMedia('(min-width: 1024px)').matches ||
    navigator.hardwareConcurrency <= 2 ||
    reducedMotion.matches
  ) {
    fallbackVisible.value = true
    return
  }

  try {
    const THREE = await import('three')
    const { RoundedBoxGeometry } = await import('three/addons/geometries/RoundedBoxGeometry.js')
    if (reducedMotion.matches) {
      fallbackVisible.value = true
      return
    }
    const renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true, canvas: canvas.value })
    const scene = new THREE.Scene()
    const camera = new THREE.PerspectiveCamera(34, 1, 0.1, 100)
    const workstation = new THREE.Group()
    const pointer = new THREE.Vector2()
    const raycaster = new THREE.Raycaster()
    const interactive: THREE.Object3D[] = []
    const screenCanvas = document.createElement('canvas')
    const screenContext = screenCanvas.getContext('2d')!
    const screenTexture = new THREE.CanvasTexture(screenCanvas)
    const materials = [
      new THREE.MeshStandardMaterial({ color: 0x17242c, roughness: 0.5, metalness: 0.56 }),
      new THREE.MeshStandardMaterial({ color: 0x56646d, roughness: 0.38, metalness: 0.65 }),
      new THREE.MeshBasicMaterial({ map: screenTexture })
    ]
    const [matte, edge, screen] = materials
    let hovered: THREE.Object3D | undefined
    let frame = 0

    screenCanvas.width = 720
    screenCanvas.height = 480
    screenTexture.colorSpace = THREE.SRGBColorSpace
    screenTexture.anisotropy = renderer.capabilities.getMaxAnisotropy()
    workstation.position.set(2.55, 0, 0)
    workstation.scale.setScalar(0.85)
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 1.5))
    renderer.shadowMap.enabled = true
    renderer.shadowMap.type = THREE.PCFShadowMap
    renderer.toneMapping = THREE.ACESFilmicToneMapping
    renderer.toneMappingExposure = 1.1
    camera.position.set(5.6, 3.8, 8.2)
    camera.lookAt(0.35, -0.1, 0)

    scene.add(new THREE.HemisphereLight(0xffffff, 0x17242c, 2.3))
    const keyLight = new THREE.DirectionalLight(0xffffff, 3.4)
    keyLight.position.set(3, 6, 5)
    keyLight.castShadow = true
    scene.add(keyLight)
    const fillLight = new THREE.DirectionalLight(0x61b7d1, 1.15)
    fillLight.position.set(-5, 2, 1)
    scene.add(fillLight)

    const block = (size: [number, number, number], position: [number, number, number], material = matte, radius = 0.04) => {
      const mesh = new THREE.Mesh(new RoundedBoxGeometry(...size, 3, radius), material)
      mesh.position.set(...position)
      mesh.castShadow = true
      mesh.receiveShadow = true
      workstation.add(mesh)
      return mesh
    }

    block([5.8, 0.18, 3], [0.1, -0.82, 0], edge, 0.06)
    block([5, 0.08, 2.45], [0.1, -0.67, 0], matte, 0.03)

    block([3.48, 2.5, 0.2], [0.85, 0.58, -0.18], matte, 0.12)
    block([3.13, 2.15, 0.04], [0.85, 0.58, -0.06], screen, 0.02)
    block([0.2, 0.96, 0.22], [0.85, -0.46, -0.04], edge, 0.05)
    block([1.38, 0.13, 0.58], [0.85, -0.72, 0.22], edge, 0.05)

    block([2.6, 0.18, 1.02], [-0.68, -0.53, 0.82], matte, 0.08)
    for (let row = 0; row < 4; row++) {
      const count = row === 3 ? 8 : 10
      const offset = row === 3 ? 0.2 : 0
      for (let column = 0; column < count; column++) {
        block([0.19, 0.09, 0.17], [-1.64 + offset + column * 0.22, -0.39, 0.47 + row * 0.2], edge, 0.025)
      }
    }
    block([0.92, 0.09, 0.17], [-0.86, -0.39, 1.07], edge, 0.025)

    const button = (y: number, href: string, label: string) => {
      const mesh = new THREE.Mesh(new THREE.PlaneGeometry(2.4, 0.48), new THREE.MeshBasicMaterial({ transparent: true, opacity: 0 }))
      mesh.position.set(0.85, y, -0.03)
      mesh.userData = { href, label }
      workstation.add(mesh)
      interactive.push(mesh)
    }
    button(0.68, '/projects', 'Projects')
    button(0.02, '/experiences', 'Experience')

    scene.add(workstation)

    const isDark = () => document.documentElement.dataset.theme === 'dark' || (!document.documentElement.dataset.theme && window.matchMedia('(prefers-color-scheme: dark)').matches)
    const drawScreen = () => {
      const dark = isDark()
      const background = dark ? '#15313d' : '#173440'
      const panel = dark ? '#244853' : '#254d5b'
      const border = dark ? '#78c7dc' : '#5eb8d2'
      screenContext.fillStyle = background
      screenContext.fillRect(0, 0, screenCanvas.width, screenCanvas.height)
      screenContext.fillStyle = border
      screenContext.fillRect(48, 52, 6, 48)
      screenContext.fillStyle = dark ? '#e5f0f3' : '#edf5f7'
      screenContext.font = '600 27px Commissioner, sans-serif'
      screenContext.fillText('ANDRA / WORKSPACE', 74, 83)
      screenContext.font = '400 17px Commissioner, sans-serif'
      screenContext.fillStyle = dark ? '#afc5cd' : '#b7cad0'
      screenContext.fillText('Select a route to inspect the work.', 74, 113)

      for (const [index, [title, detail]] of [['Projects', 'Yifa — now building'], ['Experience', '2017 — now']] .entries()) {
        const y = 156 + index * 132
        const active = hovered?.userData.label === title
        screenContext.fillStyle = active ? '#2e6575' : panel
        screenContext.fillRect(74, y, 572, 100)
        screenContext.strokeStyle = active ? '#8ae1f6' : '#5d8794'
        screenContext.lineWidth = active ? 4 : 2
        screenContext.strokeRect(74, y, 572, 100)
        screenContext.fillStyle = '#f2f8fa'
        screenContext.font = '600 30px Commissioner, sans-serif'
        screenContext.fillText(title, 100, y + 42)
        screenContext.fillStyle = dark ? '#c2d8df' : '#cce0e5'
        screenContext.font = '400 19px Commissioner, sans-serif'
        screenContext.fillText(detail, 100, y + 74)
        screenContext.fillStyle = '#8ae1f6'
        screenContext.font = '600 28px Commissioner, sans-serif'
        screenContext.fillText('→', 602, y + 60)
      }
      screenTexture.needsUpdate = true
    }
    const theme = () => {
      const dark = isDark()
      matte.color.set(dark ? 0x31444e : 0x17242c)
      edge.color.set(dark ? 0x71848d : 0x56646d)
      drawScreen()
      renderer.setClearColor(0x000000, 0)
    }
    theme()
    const themeObserver = new MutationObserver(theme)
    themeObserver.observe(document.documentElement, { attributes: true, attributeFilter: ['data-theme'] })
    const colorSchemeMedia = window.matchMedia('(prefers-color-scheme: dark)')
    colorSchemeMedia.addEventListener('change', theme)

    const resize = () => {
      if (!canvas.value) return
      const { width, height } = canvas.value.getBoundingClientRect()
      renderer.setSize(width, height, false)
      camera.aspect = width / height
      camera.updateProjectionMatrix()
    }
    const resizeObserver = new ResizeObserver(resize)
    resizeObserver.observe(canvas.value)
    resize()

    const updatePointer = (event: MouseEvent) => {
      const rect = canvas.value!.getBoundingClientRect()
      pointer.set(((event.clientX - rect.left) / rect.width) * 2 - 1, -((event.clientY - rect.top) / rect.height) * 2 + 1)
      raycaster.setFromCamera(pointer, camera)
      const next = raycaster.intersectObjects(interactive)[0]?.object
      if (hovered === next) return
      hovered = next
      canvas.value!.style.cursor = next ? 'pointer' : ''
      drawScreen()
    }
    const onClick = (event: MouseEvent) => {
      updatePointer(event)
      if (hovered?.userData.href) router.push(hovered.userData.href)
    }
    const onLeave = () => {
      if (!hovered) return
      hovered = undefined
      canvas.value!.style.cursor = ''
      drawScreen()
    }
    canvas.value.addEventListener('pointermove', updatePointer)
    canvas.value.addEventListener('click', onClick)
    canvas.value.addEventListener('pointerleave', onLeave)

    const started = performance.now()
    let firstFrame = true
    const render = (time: number) => {
      const progress = Math.min((time - started) / 800, 1)
      workstation.position.y = (1 - progress) * 0.55 + Math.sin(time / 2600) * 0.018
      workstation.rotation.y = Math.sin(time / 4600) * 0.018
      renderer.render(scene, camera)
      if (firstFrame) {
        firstFrame = false
        canvasReady.value = true
      }
      frame = requestAnimationFrame(render)
    }
    frame = requestAnimationFrame(render)
    const stopForReducedMotion = () => {
      if (!reducedMotion.matches) return
      cancelAnimationFrame(frame)
      canvasReady.value = false
      fallbackVisible.value = true
    }
    reducedMotion.addEventListener('change', stopForReducedMotion)

    dispose = () => {
      cancelAnimationFrame(frame)
      resizeObserver.disconnect()
      themeObserver.disconnect()
      colorSchemeMedia.removeEventListener('change', theme)
      reducedMotion.removeEventListener('change', stopForReducedMotion)
      canvas.value?.removeEventListener('pointermove', updatePointer)
      canvas.value?.removeEventListener('click', onClick)
      canvas.value?.removeEventListener('pointerleave', onLeave)
      scene.traverse((object) => {
        if (object instanceof THREE.Mesh) {
          object.geometry.dispose()
          if (Array.isArray(object.material)) object.material.forEach(material => material.dispose())
          else if (object.material !== screen) object.material.dispose()
        }
      })
      screenTexture.dispose()
      materials.forEach(material => material.dispose())
      renderer.dispose()
    }
  } catch {
    canvasReady.value = false
    fallbackVisible.value = true
  }
})
</script>

<template>
  <section class="relative isolate min-h-[calc(100svh-5.25rem)] overflow-hidden border-b border-rule" aria-label="Digital workstation">
    <div class="absolute inset-0 opacity-100 transition-opacity duration-300 md:opacity-0" :class="fallbackVisible ? 'md:opacity-100' : ''" aria-hidden="true">
      <div class="absolute left-[58%] top-[29%] h-[38%] w-[29%] border-[0.6rem] border-control bg-surface max-md:left-auto max-md:right-6 max-md:top-[72%] max-md:h-[18%] max-md:w-[28%]" />
      <div class="absolute left-[70%] top-[67%] h-16 w-2 bg-control max-md:left-auto max-md:right-[4.875rem] max-md:top-[90%] max-md:h-4" />
      <div class="absolute left-[65%] top-[72%] h-3 w-[22%] bg-control max-md:left-auto max-md:right-6 max-md:top-[92%] max-md:w-[28%]" />
      <div class="absolute left-[55%] top-[74%] h-14 w-[25%] -skew-x-12 border border-control bg-surface max-md:left-auto max-md:right-8 max-md:top-[95%] max-md:h-8 max-md:w-[26%]" />
    </div>
    <canvas ref="canvas" class="absolute inset-0 h-full w-full transition-opacity duration-300" :class="canvasReady ? 'opacity-100' : 'opacity-0'" aria-hidden="true" />

    <div class="pointer-events-none relative mx-auto grid min-h-[calc(100svh-5.25rem)] w-full max-w-[76rem] content-start px-4 pb-10 pt-20 md:grid-cols-[minmax(0,0.9fr)_minmax(22rem,1.1fr)] md:px-6 md:pt-24">
      <div class="pointer-events-auto min-w-0">
        <p class="text-xs font-semibold text-accent-ink">Senior Full Stack Developer</p>
        <h1 class="mt-4 text-[clamp(2.5rem,7vw,5.75rem)] font-semibold leading-[0.98] tracking-[-0.03em] text-ink text-balance">
          Andra Satria.
        </h1>
        <p class="mt-6 max-w-2xl text-[clamp(1.75rem,4vw,3rem)] font-semibold leading-[1.05] tracking-[-0.03em] text-muted text-balance">
          Building products from 0 to 1.
        </p>
        <p class="mt-6 max-w-[48ch] text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
          Now working remotely at <TextLink href="https://jitera.com/">Jitera</TextLink> as Senior Full Stack Developer.
        </p>
        <div class="mt-6 flex flex-wrap gap-x-5 gap-y-2 text-sm font-medium">
          <NuxtLink to="/projects" class="inline-flex min-h-11 items-center text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">Explore Yifa →</NuxtLink>
          <NuxtLink to="/experiences" class="inline-flex min-h-11 items-center text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">View experience →</NuxtLink>
        </div>
      </div>
    </div>
  </section>
</template>
