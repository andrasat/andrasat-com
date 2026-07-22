<script setup lang="ts">
const year = new Date().getFullYear()
</script>

<template>
  <footer id="contact" class="border-t border-rule">
    <div class="mx-auto flex w-full max-w-[76rem] flex-col gap-4 px-4 py-10 md:flex-row md:items-end md:justify-between md:px-6">
      <div class="max-w-[66ch] space-y-2">
        <h2 class="text-base font-semibold text-ink">Contact</h2>
        <p class="text-sm leading-7 text-muted">
          Feel free to reach out for collaborations or just a friendly hello.
        </p>
        <div class="flex flex-wrap gap-x-4 gap-y-1">
          <a href="mailto:andra.satria1@gmail.com" class="inline-flex min-h-11 items-center text-sm font-medium text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">Email Andra</a>
          <a href="https://www.linkedin.com/in/andrasat/" target="_blank" rel="noopener noreferrer" class="inline-flex min-h-11 items-center text-sm font-medium text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">LinkedIn</a>
          <a href="https://github.com/andrasat" target="_blank" rel="noopener noreferrer" class="inline-flex min-h-11 items-center text-sm font-medium text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">GitHub</a>
        </div>
      </div>
      <p class="text-sm leading-7 text-muted">© {{ year }} Andra Satria. All rights reserved.</p>
    </div>
  </footer>
</template>
