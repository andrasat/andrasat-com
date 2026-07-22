<template>
  <div class="flex min-h-[100dvh] flex-col bg-canvas font-sans text-ink selection:bg-accent-ink selection:text-canvas">
    <a href="#main-content" class="sr-only focus:fixed focus:left-4 focus:top-4 focus:z-50 focus:inline-flex focus:min-h-11 focus:items-center focus:rounded-lg focus:border focus:border-control focus:bg-surface focus:px-4 focus:font-medium focus:text-accent-ink focus:not-sr-only">
      Skip to content
    </a>
    <MyHeader />
    <main id="main-content" tabindex="-1" class="flex-1" aria-label="Main content">
      <slot />
    </main>
    <MyFooter />
  </div>
</template>
