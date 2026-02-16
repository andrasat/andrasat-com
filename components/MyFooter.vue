<script setup lang="ts">
const year = new Date().getFullYear()
</script>

<template>
  <footer class="p-8 md:p-12 mt-32 border-t border-gray-800 bg-licorice/50 backdrop-blur-sm relative">
    <div class="max-w-4xl mx-auto flex flex-col md:flex-row justify-between items-center gap-8">
      <div class="space-y-4 text-center md:text-left">
        <h5 id="contact" class="text-white font-mono font-bold text-xl flex items-center justify-center md:justify-start">
          <span class="text-aero mr-2">></span> contact.init()
        </h5>
        <p class="text-gray-400 max-w-xs">
          Feel free to reach out for collaborations or just a friendly hello.
        </p>
        <div class="flex flex-row justify-center md:justify-start gap-4">
          <a href="mailto:andra.satria1@gmail.com" class="group p-3 rounded-xl bg-gray-800/50 hover:bg-aero/20 border border-gray-700 hover:border-aero transition-all duration-300">
            <i class="fa-solid fa-envelope h-5 w-5 group-hover:scale-110 transition-transform" />
          </a>
          <a href="https://www.linkedin.com/in/andrasat/" class="group p-3 rounded-xl bg-gray-800/50 hover:bg-aero/20 border border-gray-700 hover:border-aero transition-all duration-300">
            <i class="fa-brands fa-linkedin h-5 w-5 group-hover:scale-110 transition-transform" />
          </a>
          <a href="https://github.com/andrasat" class="group p-3 rounded-xl bg-gray-800/50 hover:bg-aero/20 border border-gray-700 hover:border-aero transition-all duration-300">
            <i class="fa-brands fa-github h-5 w-5 group-hover:scale-110 transition-transform" />
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
      </div>
    </div>
    
    <!-- Decorative element -->
    <div class="absolute bottom-0 right-0 w-32 h-32 bg-aero/5 blur-3xl rounded-full -z-10" />
  </footer>
</template>
