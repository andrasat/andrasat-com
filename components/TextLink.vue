<script setup lang="ts">
defineProps({
  href: { type: String, default: '#' },
  rel: { type: String, default: 'noopener noreferrer' },
  target: { type: String, default: '_blank' }
})
</script>

<template>
  <a :href="href" :rel="rel" :target="target" class="text-aero hover:text-white transition-colors duration-200 decoration-aero/30 hover:decoration-white underline underline-offset-4">
    <slot />
  </a>
</template>
