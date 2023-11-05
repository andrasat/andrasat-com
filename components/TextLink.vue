<script setup lang="ts">
defineProps({
  href: { type: String, default: '#' },
  rel: { type: String, default: 'noopener noreferrer' },
  target: { type: String, default: '_blank' }
})
</script>

<template>
  <a :href="href" :rel="rel" :target="target" class="text-blue-500">
    <slot />
  </a>
</template>
