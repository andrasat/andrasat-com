<script setup lang="ts">
const isScrolled = ref(false)

function onScroll () {
  isScrolled.value = window.scrollY > 20
}

onMounted(() => {
  window.addEventListener('scroll', onScroll)
  onScroll()
})

onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
})
</script>

<template>
  <header 
    class="p-4 h-20 top-0 fixed w-full flex flex-row justify-between items-center z-50 transition-all duration-300"
    :class="{ 'backdrop-blur-md bg-licorice/70 border-b border-gray-800 shadow-lg': isScrolled }"
  >
    <div class="flex flex-row items-center">
      <NuxtLink to="/" class="flex items-center group">
        <div class="relative overflow-hidden rounded-full w-12 h-12 transition-transform duration-300 group-hover:scale-110">
          <img
            src="~/assets/images/andrasat_icon.png"
            alt="andrasat"
            height="48"
            width="48"
            class="object-cover"
          >
        </div>
        <h1 class="ml-3 font-mono font-bold text-xl tracking-tight text-white group-hover:text-aero transition-colors duration-300">
          // andrasat
        </h1>
      </NuxtLink>
    </div>

    <ClientOnly>
      <HeaderMenu />
    </ClientOnly>
  </header>
</template>
