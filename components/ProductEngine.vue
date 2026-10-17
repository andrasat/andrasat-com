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
    const { RoomEnvironment } = await import('three/addons/environments/RoomEnvironment.js')
    if (reducedMotion.matches) {
      fallbackVisible.value = true
      return
    }
    const renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true, canvas: canvas.value })
    const scene = new THREE.Scene()
    const camera = new THREE.PerspectiveCamera(30, 1, 0.1, 100)
    const workstation = new THREE.Group()
    const pointer = new THREE.Vector2()
    const tilt = new THREE.Vector2()
    const raycaster = new THREE.Raycaster()
    const pmrem = new THREE.PMREMGenerator(renderer)
    const environment = pmrem.fromScene(new RoomEnvironment(), 0.04).texture
    const screenCanvas = document.createElement('canvas')
    const screenContext = screenCanvas.getContext('2d')!
    const screenTexture = new THREE.CanvasTexture(screenCanvas)
    const materials = {
      body: new THREE.MeshStandardMaterial({ roughness: 0.42, metalness: 0.6 }),
      metal: new THREE.MeshStandardMaterial({ roughness: 0.28, metalness: 0.9 }),
      desk: new THREE.MeshStandardMaterial({ roughness: 0.72 }),
      mat: new THREE.MeshStandardMaterial({ roughness: 0.95 }),
      key: new THREE.MeshStandardMaterial({ roughness: 0.55, metalness: 0.1 }),
      accent: new THREE.MeshStandardMaterial({ color: 0x4fb3d4, roughness: 0.35 }),
      coffee: new THREE.MeshStandardMaterial({ color: 0x2b1a12, roughness: 0.15 }),
      screen: new THREE.MeshBasicMaterial({ map: screenTexture, toneMapped: false })
    }
    const routes = [
      { label: 'Projects', detail: 'Yifa · English interview practice', href: '/projects', y: 236 },
      { label: 'Experience', detail: '2017 — now', href: '/experiences', y: 392 }
    ]
    let hovered: (typeof routes)[number] | undefined
    let frame = 0

    screenCanvas.width = 1024
    screenCanvas.height = 636
    screenTexture.colorSpace = THREE.SRGBColorSpace
    screenTexture.anisotropy = renderer.capabilities.getMaxAnisotropy()
    workstation.position.set(2.55, 0, 0)
    workstation.scale.setScalar(0.8)
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 1.5))
    renderer.shadowMap.enabled = true
    renderer.shadowMap.type = THREE.PCFShadowMap
    renderer.toneMapping = THREE.ACESFilmicToneMapping
    renderer.toneMappingExposure = 1.05
    scene.environment = environment
    scene.environmentIntensity = 0.5
    camera.position.set(6.2, 3.6, 9.4)
    camera.lookAt(0.6, -0.15, 0)

    scene.add(new THREE.HemisphereLight(0xffffff, 0x17242c, 1.2))
    const keyLight = new THREE.DirectionalLight(0xffffff, 2.6)
    keyLight.position.set(5.5, 7, 5)
    keyLight.target.position.copy(workstation.position)
    keyLight.castShadow = true
    keyLight.shadow.mapSize.set(2048, 2048)
    keyLight.shadow.camera.left = keyLight.shadow.camera.bottom = -4.5
    keyLight.shadow.camera.right = keyLight.shadow.camera.top = 4.5
    keyLight.shadow.bias = -0.0004
    keyLight.shadow.normalBias = 0.02
    keyLight.shadow.radius = 4
    scene.add(keyLight, keyLight.target)
    const rimLight = new THREE.DirectionalLight(0x61b7d1, 1.3)
    rimLight.position.set(-4, 3, -4)
    scene.add(rimLight)

    const add = <T extends THREE.Object3D>(parent: THREE.Object3D, object: T, position: [number, number, number]) => {
      object.position.set(...position)
      object.traverse((child) => {
        child.castShadow = true
        child.receiveShadow = true
      })
      parent.add(object)
      return object
    }
    const block = (parent: THREE.Object3D, size: [number, number, number], position: [number, number, number], material: THREE.Material, radius = 0.04) =>
      add(parent, new THREE.Mesh(new RoundedBoxGeometry(...size, 4, radius), material), position)

    // Desk with a mat under the keyboard and mouse.
    const desk = add(workstation, new THREE.Group(), [0, 0, 0])
    block(desk, [6.4, 0.16, 3.2], [0.2, -0.9, 0], materials.desk, 0.07)
    block(desk, [3.9, 0.02, 1.35], [-0.2, -0.81, 0.85], materials.mat, 0.01)

    // Monitor: thin panel, rear housing, angled neck and flat foot.
    const monitor = add(workstation, new THREE.Group(), [0.7, 0, -0.5])
    block(monitor, [1.3, 0.05, 0.78], [0, -0.795, 0.08], materials.metal, 0.024)
    block(monitor, [0.34, 1.42, 0.07], [0, -0.12, -0.2], materials.metal, 0.03).rotation.x = -0.12
    const panel = add(monitor, new THREE.Group(), [0, 0.78, 0])
    panel.rotation.x = -0.05
    block(panel, [3.55, 2.25, 0.08], [0, 0, 0], materials.body, 0.035)
    block(panel, [2.3, 1.45, 0.18], [0, -0.05, -0.1], materials.body, 0.08)
    const screenMesh = add(panel, new THREE.Mesh(new THREE.PlaneGeometry(3.45, 2.14), materials.screen), [0, 0, 0.041])
    screenMesh.castShadow = false
    const glow = new THREE.PointLight(0x5ec8e6, 1.6, 4.5, 2)
    glow.position.set(0, -0.2, 0.9)
    panel.add(glow)

    // Keyboard: aluminium deck with an instanced 60% key layout.
    const keyboard = add(workstation, new THREE.Group(), [-0.55, -0.8, 0.82])
    keyboard.rotation.set(0.04, 0.05, 0)
    block(keyboard, [2.86, 0.07, 1.0], [0, 0.035, 0], materials.metal, 0.03)
    const layout = [
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
      [1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5],
      [1.75, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2.25],
      [2.25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2.75],
      [1.25, 1.25, 1.25, 6.25, 1.25, 1.25, 1.25, 1.25]
    ]
    const pitch = 0.178
    const keys = new THREE.InstancedMesh(new RoundedBoxGeometry(1, 1, 1, 2, 0.18), materials.key, layout.flat().length)
    const accentKeys = new Set(['0:0', '2:12'])
    const keyMatrix = new THREE.Object3D()
    const accentKeyFlags: boolean[] = []
    let keyIndex = 0
    layout.forEach((row, rowIndex) => {
      let x = -7.5 * pitch
      row.forEach((width, columnIndex) => {
        keyMatrix.position.set(x + (width * pitch) / 2, 0.095, (rowIndex - 2) * pitch)
        keyMatrix.scale.set(width * pitch - 0.028, 0.05, pitch - 0.028)
        keyMatrix.updateMatrix()
        keys.setMatrixAt(keyIndex, keyMatrix.matrix)
        accentKeyFlags[keyIndex++] = accentKeys.has(`${rowIndex}:${columnIndex}`)
        x += width * pitch
      })
    })
    add(keyboard, keys, [0, 0, 0])

    // Mouse and mug.
    const mouse = add(workstation, new THREE.Mesh(new THREE.CapsuleGeometry(0.13, 0.16, 8, 24), materials.body), [1.6, -0.76, 0.95])
    mouse.rotation.set(Math.PI / 2, 0, -0.12)
    mouse.scale.set(1, 1, 0.42)
    const mug = add(workstation, new THREE.Group(), [2.4, -0.6, 0.25])
    add(mug, new THREE.Mesh(new THREE.CylinderGeometry(0.2, 0.18, 0.42, 40), materials.accent), [0, 0, 0])
    add(mug, new THREE.Mesh(new THREE.TorusGeometry(0.11, 0.032, 12, 32, Math.PI * 1.3), materials.accent), [0.2, 0, 0]).rotation.z = -Math.PI * 0.65
    add(mug, new THREE.Mesh(new THREE.CircleGeometry(0.175, 40), materials.coffee), [0, 0.18, 0]).rotation.x = -Math.PI / 2

    scene.add(workstation)

    // Parts settle into place once, staggered, then the scene renders on demand.
    const parts = [desk, monitor, keyboard, mouse, mug].map((object, index) => ({ object, y: object.position.y, delay: index * 90 }))
    const easeOut = (value: number) => 1 - Math.pow(1 - value, 3)

    const isDark = () => document.documentElement.dataset.theme === 'dark' || (!document.documentElement.dataset.theme && window.matchMedia('(prefers-color-scheme: dark)').matches)
    const drawScreen = () => {
      const context = screenContext
      const { width, height } = screenCanvas
      const background = context.createLinearGradient(0, 0, 0, height)
      background.addColorStop(0, '#16374a')
      background.addColorStop(1, '#0c1f29')
      context.fillStyle = background
      context.fillRect(0, 0, width, height)

      context.fillStyle = 'rgba(255, 255, 255, 0.05)'
      context.fillRect(0, 0, width, 52)
      for (const [index, color] of ['#e7766d', '#e7c46d', '#7fd19a'].entries()) {
        context.fillStyle = color
        context.beginPath()
        context.arc(34 + index * 24, 26, 7, 0, Math.PI * 2)
        context.fill()
      }
      context.fillStyle = '#8fb0bc'
      context.font = '500 18px Commissioner, sans-serif'
      context.textAlign = 'center'
      context.fillText('andrasat.com', width / 2, 32)
      context.textAlign = 'left'

      context.fillStyle = '#7fd3ea'
      context.font = '600 16px Commissioner, sans-serif'
      context.fillText('WORKSPACE', 64, 108)
      context.fillStyle = '#eef6f8'
      context.font = '600 40px Commissioner, sans-serif'
      context.fillText('Andra Satria', 64, 154)
      context.fillStyle = '#a9c3cc'
      context.font = '400 20px Commissioner, sans-serif'
      context.fillText('Select a route to inspect the work.', 64, 190)

      for (const route of routes) {
        const active = hovered === route
        context.beginPath()
        context.roundRect(64, route.y, width - 128, 128, 16)
        context.fillStyle = active ? 'rgba(127, 211, 234, 0.18)' : 'rgba(255, 255, 255, 0.06)'
        context.fill()
        context.lineWidth = active ? 3 : 1.5
        context.strokeStyle = active ? '#8ae1f6' : 'rgba(143, 176, 188, 0.45)'
        context.stroke()
        context.fillStyle = '#f2f8fa'
        context.font = '600 34px Commissioner, sans-serif'
        context.fillText(route.label, 100, route.y + 56)
        context.fillStyle = '#b5cdd5'
        context.font = '400 21px Commissioner, sans-serif'
        context.fillText(route.detail, 100, route.y + 92)
        context.fillStyle = '#8ae1f6'
        context.font = '600 34px Commissioner, sans-serif'
        context.fillText('→', width - 132 + (active ? 8 : 0), route.y + 76)
      }
      screenTexture.needsUpdate = true
    }
    const theme = () => {
      const dark = isDark()
      materials.body.color.set(dark ? 0x3b4e58 : 0x2b3a42)
      materials.metal.color.set(dark ? 0x8fa0a8 : 0xaab6bd)
      materials.desk.color.set(dark ? 0x24323a : 0xd3dce1)
      materials.mat.color.set(dark ? 0x162128 : 0x33444d)
      const keyColor = new THREE.Color(dark ? 0x2e3f48 : 0x24323a)
      const accentColor = new THREE.Color(0x4fb3d4)
      for (let index = 0; index < keys.count; index++) keys.setColorAt(index, accentKeyFlags[index] ? accentColor : keyColor)
      keys.instanceColor!.needsUpdate = true
      materials.key.color.set(0xffffff)
      renderer.setClearColor(0x000000, 0)
      drawScreen()
      requestRender()
    }

    const resize = () => {
      if (!canvas.value) return
      const { width, height } = canvas.value.getBoundingClientRect()
      renderer.setSize(width, height, false)
      camera.aspect = width / height
      camera.updateProjectionMatrix()
      requestRender()
    }

    const updatePointer = (event: MouseEvent) => {
      const rect = canvas.value!.getBoundingClientRect()
      pointer.set(((event.clientX - rect.left) / rect.width) * 2 - 1, -((event.clientY - rect.top) / rect.height) * 2 + 1)
      raycaster.setFromCamera(pointer, camera)
      const uv = raycaster.intersectObject(screenMesh)[0]?.uv
      const y = uv && (1 - uv.y) * screenCanvas.height
      const x = uv && uv.x * screenCanvas.width
      const next = uv ? routes.find(route => x! >= 64 && x! <= screenCanvas.width - 64 && y! >= route.y && y! <= route.y + 128) : undefined
      requestRender()
      if (hovered === next) return
      hovered = next
      canvas.value!.style.cursor = next ? 'pointer' : ''
      drawScreen()
    }
    const onClick = (event: MouseEvent) => {
      updatePointer(event)
      if (hovered) router.push(hovered.href)
    }
    const onLeave = () => {
      pointer.set(0, 0)
      requestRender()
      if (!hovered) return
      hovered = undefined
      canvas.value!.style.cursor = ''
      drawScreen()
    }

    const started = performance.now()
    const render = (time: number) => {
      frame = 0
      let settling = false
      for (const part of parts) {
        const progress = Math.min(Math.max((time - started - part.delay) / 700, 0), 1)
        part.object.position.y = part.y + (1 - easeOut(progress)) * 0.6
        settling ||= progress < 1
      }
      // Pointer gives a small eased tilt; the camera itself stays fixed.
      tilt.lerp(pointer, 0.08)
      workstation.rotation.set(-tilt.y * 0.025, tilt.x * 0.06, 0)
      renderer.render(scene, camera)
      if (!canvasReady.value) canvasReady.value = true
      if (settling || tilt.distanceTo(pointer) > 0.001) requestRender()
    }
    function requestRender () {
      if (!frame) frame = requestAnimationFrame(render)
    }

    theme()
    document.fonts?.ready.then(() => {
      drawScreen()
      requestRender()
    })
    const themeObserver = new MutationObserver(theme)
    themeObserver.observe(document.documentElement, { attributes: true, attributeFilter: ['data-theme'] })
    const colorSchemeMedia = window.matchMedia('(prefers-color-scheme: dark)')
    colorSchemeMedia.addEventListener('change', theme)
    const resizeObserver = new ResizeObserver(resize)
    resizeObserver.observe(canvas.value)
    resize()
    canvas.value.addEventListener('pointermove', updatePointer)
    canvas.value.addEventListener('click', onClick)
    canvas.value.addEventListener('pointerleave', onLeave)

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
        if (object instanceof THREE.Mesh) object.geometry.dispose()
      })
      keys.dispose()
      Object.values(materials).forEach(material => material.dispose())
      screenTexture.dispose()
      environment.dispose()
      pmrem.dispose()
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
