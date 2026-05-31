<script setup lang="ts">
import { PhEnvelopeSimple, PhLinkedinLogo, PhGithubLogo } from '@phosphor-icons/vue'

const year = new Date().getFullYear()
</script>

<template>
  <footer class="pt-8 px-8 md:pt-12 md:px-12 border-t border-gray-800 bg-licorice/50 backdrop-blur-sm relative" style="padding-bottom: max(2rem, env(safe-area-inset-bottom))">
    <div class="max-w-4xl mx-auto flex flex-col md:flex-row justify-between items-center gap-8">
      <div class="space-y-4 text-center md:text-left">
        <h5 id="contact" class="text-white font-mono font-bold text-xl flex items-center justify-center md:justify-start">
          <span class="text-aero mr-2">></span> contact.init()
        </h5>
        <p class="text-gray-400 max-w-xs">
          Feel free to reach out for collaborations or just a friendly hello.
        </p>
        <div class="flex flex-row justify-center md:justify-start gap-4">
          <a href="mailto:andra.satria1@gmail.com" aria-label="Email" class="group p-3 rounded-xl bg-gray-800/50 hover:bg-aero/20 border border-gray-700 hover:border-aero transition-all duration-300">
            <PhEnvelopeSimple :size="20" class="text-white group-hover:scale-110 transition-transform" />
          </a>
          <a href="https://www.linkedin.com/in/andrasat/" aria-label="LinkedIn" class="group p-3 rounded-xl bg-gray-800/50 hover:bg-aero/20 border border-gray-700 hover:border-aero transition-all duration-300">
            <PhLinkedinLogo :size="20" class="text-white group-hover:scale-110 transition-transform" />
          </a>
          <a href="https://github.com/andrasat" aria-label="GitHub" class="group p-3 rounded-xl bg-gray-800/50 hover:bg-aero/20 border border-gray-700 hover:border-aero transition-all duration-300">
            <PhGithubLogo :size="20" class="text-white group-hover:scale-110 transition-transform" />
          </a>
        </div>
      </div>

      <div class="text-center md:text-right space-y-2">
        <p class="text-sm font-mono text-gray-500">
          © {{ year }} Andra Satria. All rights reserved.
        </p>
        <p class="text-xs font-mono text-gray-600">
          Built with precision using Nuxt & Tailwind.
        </p>
        <div class="flex flex-wrap justify-center md:justify-end gap-3 pt-1">
          <NuxtLink class="text-xs text-gray-400 hover:text-aero transition-colors" to="/privacy-policy" aria-label="Privacy Policy — Yifa">
            Privacy
          </NuxtLink>
          <NuxtLink class="text-xs text-gray-400 hover:text-aero transition-colors" to="/terms-of-service" aria-label="Terms of Service — Yifa">
            Terms
          </NuxtLink>
          <NuxtLink class="text-xs text-gray-400 hover:text-aero transition-colors" to="/compliance" aria-label="Compliance Notice — Yifa">
            Compliance
          </NuxtLink>
        </div>
      </div>
    </div>
    
    <!-- Decorative element -->
    <div class="absolute bottom-0 right-0 w-32 h-32 bg-aero/5 blur-3xl rounded-full -z-10" />
  </footer>
</template>
