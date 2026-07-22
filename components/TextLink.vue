<script setup lang="ts">
withDefaults(defineProps<{
  readonly href: string
  readonly rel?: string
  readonly target?: string
}>(), {
  rel: 'noopener noreferrer',
  target: '_blank'
})
</script>

<template>
  <a :href="href" :rel="rel" :target="target" class="text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">
    <slot />
  </a>
</template>
