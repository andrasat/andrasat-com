<script setup lang="ts">
import { PhTerminalWindow, PhCode, PhBriefcase, PhScales, PhEnvelopeSimple } from '@phosphor-icons/vue'

const route = useRoute()
const isCurrentPage = (url: string) => {
  if (url.startsWith('#')) return false
  if (url === '/') return route.path === '/'
  return route.path.startsWith(url)
}

const navItems = [
  {
    name: 'About',
    url: '/'
  },
  {
    name: 'Projects',
    url: '/projects'
  },
  {
    name: 'Experience',
    url: '/experiences'
  },
  {
    name: 'Legal',
    url: '/legal'
  },
  {
    name: 'Contact',
    url: '#contact',
    mobileOnly: true
  }
]
</script>

<template>
  <div class="relative group">
    <button 
      popovertarget="nav-menu"
      aria-label="Navigation menu"
      class="h-10 min-h-[44px] min-w-[44px] px-3 rounded-full flex items-center justify-center bg-gray-800/50 hover:bg-gray-700/50 border border-gray-700 transition-all duration-300 group shadow-md active:scale-95"
    >
      <div class="flex flex-col items-center justify-center w-5">
        <span class="h-0.5 w-full bg-aero mb-1 transition-all group-hover:w-3/4" />
        <span class="h-0.5 w-full bg-aero mb-1" />
        <span class="h-0.5 w-full bg-aero transition-all group-hover:w-3/4" />
      </div>
      <span class="ml-2 font-mono text-sm hidden sm:block text-gray-300">Menu</span>
    </button>

    <div id="nav-menu" popover class="backdrop-blur-xl bg-licorice/90 text-gray-300 border border-gray-700 rounded-xl shadow-2xl p-2 animate-fade-in ring-1 ring-white/10" aria-label="Site navigation">
      <ul class="flex flex-col gap-1 w-48">
        <li v-for="item in navItems" :key="item.name" :class="{ 'md:hidden': item.mobileOnly }">
          <NuxtLink 
            :to="item.url"
            :aria-current="isCurrentPage(item.url) ? 'page' : undefined"
            class="flex items-center px-4 py-3 rounded-lg hover:bg-white/10 transition-colors group"
          >
            <PhTerminalWindow v-if="item.name === 'About'" :size="20" class="text-aero group-hover:scale-110 transition-transform duration-300" />
            <PhCode v-else-if="item.name === 'Projects'" :size="20" class="text-aero group-hover:scale-110 transition-transform duration-300" />
            <PhBriefcase v-else-if="item.name === 'Experience'" :size="20" class="text-aero group-hover:scale-110 transition-transform duration-300" />
            <PhScales v-else-if="item.name === 'Legal'" :size="20" class="text-aero group-hover:scale-110 transition-transform duration-300" />
            <PhEnvelopeSimple v-else-if="item.name === 'Contact'" :size="20" class="text-aero group-hover:scale-110 transition-transform duration-300" />
            <span class="ml-3 font-medium">{{ item.name }}</span>
          </NuxtLink>
        </li>
      </ul>
    </div>
  </div>
</template>

<style scoped>
#nav-menu {
  margin: 0;
  position: fixed;
  top: 85px;
  left: auto;
  right: 16px;
  overflow: visible;
}

#nav-menu::backdrop {
  background: transparent;
}

@keyframes fade-in {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}

.animate-fade-in {
  animation: fade-in 0.2s ease-out;
}
</style>
