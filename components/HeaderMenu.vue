<script setup lang="ts">
const headerMenu = ref()
const isOpened = shallowRef(false)

const headerMenuClass = computed(() => ({
  // opened
  'justify-center': isOpened.value,
  // closed
  'border-gray-300': !isOpened.value,
  'justify-evenly': !isOpened.value
}))

const span0Class = computed(() => ({
  // opened
  transform: isOpened.value,
  'rotate-45': isOpened.value,
  'origin-center': isOpened.value
}))

const span1Class = computed(() => ({
  // opened
  transform: isOpened.value,
  '-rotate-45': isOpened.value,
  'origin-center': isOpened.value
}))

const navMenuClass = computed(() => ({
  // opened
  'animate-fade-in': isOpened.value,
  absolute: isOpened.value,
  'top-16': isOpened.value,
  'right-2': isOpened.value,
  'p-2': isOpened.value,
  'text-right': isOpened.value,
  'w-40': isOpened.value,
  rounded: isOpened.value
}))

function onClick () {
  isOpened.value = !isOpened.value
}

function onClickOutside (e: Event) {
  if (isOpened.value) {
    const target = e.target as HTMLElement
    const headerMenuElement = headerMenu.value as HTMLElement

    if (!headerMenuElement.contains(target)) {
      isOpened.value = false
    }
  }
}

onMounted(() => {
  window.addEventListener('click', onClickOutside)
})

onUnmounted(() => {
  window.removeEventListener('click', onClickOutside)
})
</script>

<template>
  <div ref="headerMenu" class="cursor-pointer my-auto h-10 w-10 rounded flex flex-col items-center transition-colors duration-150 z-10" :class="headerMenuClass" @click="onClick">
    <span id="span0" class="transition-transform duration-150 inline-block h-px w-6 border-t border-t-gray-300" :class="span0Class" />
    <span id="span1" class="transition-transform duration-150 inline-block h-px w-6 border-t border-t-gray-300" :class="span1Class" />
    <span v-if="!isOpened.valueOf()" class="inline-block h-px w-6 border-t border-t-gray-300" />
  </div>

  <div v-if="isOpened.valueOf()" class="border-2 border-gray-300 rounded-md bg-licorice text-gray-300" :class="navMenuClass">
    <ul>
      <li class="focus:hover:underline">
        <NuxtLink to="/">
          About
        </NuxtLink>
      </li>
      <li class="focus:hover:underline">
        <NuxtLink to="/blog">
          Blog
        </NuxtLink>
      </li>
      <li class="focus:hover:underline">
        <NuxtLink to="#contact">
          Contact
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>
