<script setup lang="ts">
const route = useRoute()

const navItems = [
  { label: 'About', to: '/' },
  { label: 'Projects', to: '/projects' },
  { label: 'Experience', to: '/experiences' },
  { label: 'Contact', to: '#contact' }
] as const
</script>

<template>
  <header class="border-b border-rule">
    <div class="mx-auto grid min-h-[5.25rem] w-full max-w-[76rem] grid-cols-[auto_1fr] items-center gap-2 px-4 py-2 md:grid-cols-[auto_1fr_auto] md:px-6">
      <NuxtLink to="/" class="inline-flex min-h-11 items-center text-base font-semibold tracking-tight text-ink">
        andrasat
      </NuxtLink>
      <nav class="order-3 col-span-2 flex flex-wrap items-center gap-1 md:order-none md:col-span-1 md:justify-self-center" aria-label="Primary navigation">
        <NuxtLink
          v-for="item in navItems"
          :key="item.to"
          :to="item.to"
          :aria-current="item.to !== '#contact' && route.path === item.to ? 'page' : undefined"
          class="inline-flex min-h-11 items-center px-2 text-xs font-medium text-muted transition-colors duration-150 ease-out hover:text-accent-ink"
          :class="item.to !== '#contact' && route.path === item.to ? 'text-accent-ink underline decoration-2 underline-offset-4' : ''"
        >
          {{ item.label }}
        </NuxtLink>
      </nav>
      <ThemeControl class="justify-self-end" />
    </div>
  </header>
</template>
