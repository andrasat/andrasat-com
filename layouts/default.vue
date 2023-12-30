<script setup lang="ts">
import { SpeedInsights } from '@vercel/speed-insights/vue'
</script>

<template>
  <div class="dark:bg-gray-900 dark:text-gray-300 relative pt-16">
    <MyHeader />
    <slot />
    <MyFooter />
  </div>

  <SpeedInsights />
</template>
