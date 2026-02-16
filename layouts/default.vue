<template>
  <div class="bg-licorice text-gray-300 relative min-h-screen font-sans selection:bg-aero selection:text-licorice transition-colors duration-300">
    <MyHeader />
    <main class="pt-20">
      <slot />
    </main>
    <MyFooter />
  </div>
</template>
