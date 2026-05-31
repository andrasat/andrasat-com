<template>
  <div class="flex flex-col min-h-screen bg-licorice text-gray-300 font-sans selection:bg-aero selection:text-licorice transition-colors duration-300">
    <MyHeader />
    <main class="flex-1 pt-20">
      <slot />
    </main>
    <MyFooter />
  </div>
</template>
