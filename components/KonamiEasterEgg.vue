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
  isActive.value = document.documentElement.classList.toggle('terminal-mode')
  console.log(isActive.value
    ? '🎮 Konami Code Activated! Welcome to Terminal Mode.'
    : '🎮 Terminal Mode Disengaged.')
}

onMounted(() => {
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
})
</script>

<template>
  <div v-if="isActive" class="fixed bottom-4 right-4 z-[100] animate-slide-up">
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

@keyframes slide-up {
  from { opacity: 0; transform: translateY(12px); }
  to { opacity: 1; transform: translateY(0); }
}

.animate-slide-up {
  animation: slide-up 300ms cubic-bezier(0.25, 1, 0.5, 1) forwards;
}
</style>
