<script setup lang="ts">
const navItems = [
  {
    name: 'About',
    url: '/',
    icon: 'fa-light fa-terminal'
  },
  {
    name: 'Blog',
    url: '/blog',
    icon: 'fa-light fa-blog'
  },
  {
    name: 'Experience',
    url: '/experiences',
    icon: 'fa-solid fa-user-tie'
  },
  {
    name: 'Contact',
    url: '#contact',
    icon: 'fa-light fa-address-book'
  }
]
</script>

<template>
  <button popovertarget="nav-menu" class="my-auto h-10 w-10 rounded flex flex-col items-center justify-center z-10">
    <span class="h-px w-4 border-t border-t-gray-300 mb-[5px]" />
    <span class="h-px w-4 border-t border-t-gray-300 mb-[5px]" />
    <span class="h-px w-4 border-t border-t-gray-300" />
  </button>

  <div id="nav-menu" popover class="animate-fade-in border-2 border-gray-300 rounded-md bg-licorice text-gray-300">
    <ul class="p-1">
      <li v-for="item in navItems" :key="item.name" class="focus:hover:underline p-1">
        <NuxtLink :to="item.url" class="inline-block w-full">
          <i :class="item.icon + ' mr-2'" /> {{ item.name }}
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>

<style>
#nav-menu {
  margin: 0;
  position: fixed;
  top: 20px;
  left: calc(100% - 160px);
  width: 150px;
}
</style>
