<script setup lang="ts">
const konamiCode = [
  'ArrowUp', 'ArrowUp', 
  'ArrowDown', 'ArrowDown', 
  'ArrowLeft', 'ArrowRight', 
  'ArrowLeft', 'ArrowRight', 
  'b', 'a'
]
let konamiIndex = 0

const isActive = ref(false)

const handleKeydown = (e: KeyboardEvent) => {
  if (e.key === konamiCode[konamiIndex]) {
    konamiIndex++
    if (konamiIndex === konamiCode.length) {
      activateEasterEgg()
      konamiIndex = 0
    }
  } else {
    konamiIndex = 0
  }
}

const activateEasterEgg = () => {
  isActive.value = true
  document.documentElement.classList.toggle('terminal-mode')
  
  // Play a sound if possible or just show a notification
  console.log('🎮 Konami Code Activated! Welcome to Terminal Mode.')
  
  setTimeout(() => {
    if (isActive.value) {
      alert('🎮 Konami Code Activated! Terminal Mode Engaged.')
    }
  }, 100)
}

onMounted(() => {
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <div v-if="isActive" class="fixed bottom-4 right-4 z-[100] animate-bounce">
    <div class="bg-green-500 text-black px-4 py-2 rounded-full font-mono font-bold shadow-lg border-2 border-white">
      TERMINAL MODE: ON
    </div>
  </div>
</template>

<style>
.terminal-mode {
  filter: sepia(1) saturate(5) hue-rotate(90deg) brightness(0.8);
}

.terminal-mode * {
  font-family: 'Red Hat Mono', monospace !important;
}

.terminal-mode img {
  filter: grayscale(1) contrast(2);
}
</style>
