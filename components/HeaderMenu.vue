<script setup lang="ts">
const headerMenu = ref()
const isOpened = shallowRef(false)

const headerMenuClass = computed(() => ({
  // opened
  'bg-gray-100': isOpened.value,
  'justify-center': isOpened.value,
  // closed
  'border-2': !isOpened.value,
  'border-gray-300': !isOpened.value,
  'justify-evenly': !isOpened.value
}))

const span0Class = computed(() => ({
  // opened
  transform: isOpened.value,
  'rotate-45': isOpened.value,
  'origin-center': isOpened.value,
  'border-t-licorice': isOpened.value,
  // closed
  'border-t-gray-300': !isOpened.value
}))

const span1Class = computed(() => ({
  // opened
  transform: isOpened.value,
  '-rotate-45': isOpened.value,
  'origin-center': isOpened.value,
  'border-t-licorice': isOpened.value,
  // closed
  'border-t-gray-300': !isOpened.value
}))

const navMenuClass = computed(() => ({
  // opened
  'animate-fade-in': isOpened.value,
  absolute: isOpened.value,
  'top-16': isOpened.value,
  'right-2': isOpened.value,
  'p-2': isOpened.value,
  'text-right': isOpened.value,
  'bg-gray-100': isOpened.value,
  'text-licorice': isOpened.value,
  'w-40': isOpened.value,
  rounded: isOpened.value
}))

function onClick () {
  isOpened.value = !isOpened.value
}
</script>

<template>
  <div ref="headerMenu" class="cursor-pointer my-auto h-10 w-10 rounded flex flex-col items-center transition-colors duration-150 z-10" :class="headerMenuClass" @click="onClick">
    <span id="span0" class="transition-transform duration-150 inline-block h-px w-6 border-t" :class="span0Class" />
    <span id="span1" class="transition-transform duration-150 inline-block h-px w-6 border-t" :class="span1Class" />
    <span v-if="!isOpened.valueOf()" class="inline-block h-px w-6 border-t border-t-gray-300" />
  </div>

  <div v-if="isOpened.valueOf()" :class="navMenuClass">
    <ul>
      <li>
        <NuxtLink to="#about">
          About
        </NuxtLink>
      </li>
      <li>
        <NuxtLink to="#contact">
          Contact
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>
