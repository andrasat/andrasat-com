<script setup lang="ts">
import { PhDesktop, PhMoon, PhSun } from '@phosphor-icons/vue'

type ThemeChoice = 'system' | 'light' | 'dark'
type ResolvedTheme = Exclude<ThemeChoice, 'system'>

const THEME_STORAGE_KEY = 'andrasat-theme'
const choice = ref<ThemeChoice>('system')
const systemTheme = ref<ResolvedTheme>('light')
let mediaQuery: MediaQueryList | undefined

const currentLabel = computed(() => choice.value === 'system'
  ? `System (${systemTheme.value})`
  : choice.value === 'light' ? 'Light' : 'Dark')

function applyTheme (): void {
  document.documentElement.dataset.theme = choice.value === 'system'
    ? systemTheme.value
    : choice.value
}

function setTheme (nextChoice: ThemeChoice): void {
  choice.value = nextChoice
  if (nextChoice === 'system') localStorage.removeItem(THEME_STORAGE_KEY)
  else localStorage.setItem(THEME_STORAGE_KEY, nextChoice)
  applyTheme()
}

function handleSystemThemeChange (event: MediaQueryListEvent): void {
  systemTheme.value = event.matches ? 'dark' : 'light'
  if (choice.value === 'system') applyTheme()
}

onMounted(() => {
  const savedChoice = localStorage.getItem(THEME_STORAGE_KEY)
  choice.value = savedChoice === 'light' || savedChoice === 'dark' ? savedChoice : 'system'
  mediaQuery = window.matchMedia('(prefers-color-scheme: dark)')
  systemTheme.value = mediaQuery.matches ? 'dark' : 'light'
  mediaQuery.addEventListener('change', handleSystemThemeChange)
  applyTheme()
})

onUnmounted(() => mediaQuery?.removeEventListener('change', handleSystemThemeChange))
</script>

<template>
  <fieldset class="m-0 flex min-w-0 items-center gap-1 border-0 p-0" aria-label="Color theme">
    <legend class="sr-only">Color theme</legend>
    <span class="sr-only" aria-live="polite">Theme: {{ currentLabel }}</span>
    <button
      type="button"
      :aria-pressed="choice === 'system'"
      aria-label="System theme"
      title="System theme"
      class="inline-flex min-h-11 min-w-11 items-center justify-center rounded-lg border text-accent-ink transition-[background-color,border-color,transform] duration-150 ease-out hover:border-accent hover:bg-surface active:scale-[.97]"
      :class="choice === 'system' ? 'border-accent bg-surface' : 'border-control'"
      @click="setTheme('system')"
    >
      <PhDesktop :size="20" :weight="choice === 'system' ? 'fill' : 'regular'" aria-hidden="true" focusable="false" />
    </button>
    <button
      type="button"
      :aria-pressed="choice === 'light'"
      aria-label="Light theme"
      title="Light theme"
      class="inline-flex min-h-11 min-w-11 items-center justify-center rounded-lg border text-accent-ink transition-[background-color,border-color,transform] duration-150 ease-out hover:border-accent hover:bg-surface active:scale-[.97]"
      :class="choice === 'light' ? 'border-accent bg-surface' : 'border-control'"
      @click="setTheme('light')"
    >
      <PhSun :size="20" :weight="choice === 'light' ? 'fill' : 'regular'" aria-hidden="true" focusable="false" />
    </button>
    <button
      type="button"
      :aria-pressed="choice === 'dark'"
      aria-label="Dark theme"
      title="Dark theme"
      class="inline-flex min-h-11 min-w-11 items-center justify-center rounded-lg border text-accent-ink transition-[background-color,border-color,transform] duration-150 ease-out hover:border-accent hover:bg-surface active:scale-[.97]"
      :class="choice === 'dark' ? 'border-accent bg-surface' : 'border-control'"
      @click="setTheme('dark')"
    >
      <PhMoon :size="20" :weight="choice === 'dark' ? 'fill' : 'regular'" aria-hidden="true" focusable="false" />
    </button>
  </fieldset>
</template>
