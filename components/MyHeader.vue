<script setup lang="ts">
const header = ref()
const opacity = shallowRef(1)
const scrollTopRef = shallowRef(0)

function onScroll (e: Event) {
  const d = e.target as Document
  const scrollTop = d.documentElement.scrollTop
  const clientHeight = d.documentElement.clientHeight
  const scrollHeight = d.documentElement.scrollHeight

  const scrolledToBottom = scrollTop + clientHeight === scrollHeight
  const scrolledToTop = scrollTop === 0

  if (scrolledToBottom) {
    opacity.value = 0
  } else if (scrolledToTop) {
    opacity.value = 1
  } else {
    opacity.value = 1 - (scrollTop / (scrollHeight - clientHeight))
  }

  scrollTopRef.value = scrollTop

  if (header) { header.value.style.opacity = opacity.value.toString() }
}

onMounted(() => {
  window.addEventListener('scroll', onScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
})
</script>

<template>
  <header ref="header" class="p-2 md:p-3 h-16 fixed top-0 w-full flex flex-row items-center">
    <NuxtLink to="/">
      <img
        src="~/assets/images/andrasat_icon.png"
        alt="andrasat"
        height="48"
        width="48"
      >
    </NuxtLink>

    <h1 class="ml-2 font-mono">
      // andrasat
    </h1>
  </header>
</template>
