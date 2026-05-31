<template>
  <div class="flex flex-col min-h-screen bg-licorice text-gray-300 font-sans selection:bg-aero selection:text-licorice transition-colors duration-300">
    <a href="#main-content" class="sr-only focus:not-sr-only focus:fixed focus:top-4 focus:left-4 focus:z-[100] focus:bg-aero focus:text-licorice focus:px-4 focus:py-2 focus:rounded-lg focus:font-bold focus:font-mono">
      Skip to content
    </a>
    <MyHeader />
    <main id="main-content" class="flex-1 pt-20" aria-label="Main content">
      <slot />
    </main>
    <MyFooter />
  </div>
</template>
