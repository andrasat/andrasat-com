<script setup lang="ts">
const logo = ref()
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

  logo.value.style.opacity = opacity.value.toString()
}

onMounted(() => {
  window.addEventListener('scroll', onScroll)

  if (window.document.documentElement.scrollTop > logo.value.clientHeight) {
    logo.value.style.opacity = '0'
  }
})

onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
})
</script>

<template>
  <header class="p-2 h-20 top-0 fixed w-full flex flex-row justify-between">
    <div ref="logo" class="flex flex-row items-center">
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
    </div>

    <HeaderMenu />
  </header>
</template>
