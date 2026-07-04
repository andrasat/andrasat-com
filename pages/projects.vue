<script setup lang="ts">
import { PhGithubLogo, PhHammer } from '@phosphor-icons/vue'

useSeoMeta({
  title: 'andrasat - Projects',
  description: 'Projects and experiments by Andra Satria — from full-stack apps to systems programming.'
})

const nowBuilding = [
  {
    name: 'Yifa',
    tagline: 'Your Financial Assistant',
    description: 'A mobile app to track expenses and manage personal finances. Currently in pre-release development.',
    stack: ['Kotlin', 'Android'],
    link: null
  },
  {
    name: 'Trade Bot',
    tagline: 'Algorithmic trading, on Telegram',
    description: 'A trading bot with a Telegram interface — market data ingestion, strategy execution, and backtesting.',
    stack: ['Python', 'Telegram API'],
    link: null
  }
]

const selectedWorks = [
  {
    name: 'andrasat.com',
    description: 'This website. Nuxt 3 SSR behind nginx, deployed to a VPS with GitHub Actions over SSH, managed by systemd, with a hardened CSP and a legal subdomain served by server middleware.',
    stack: ['Nuxt 3', 'TailwindCSS', 'nginx', 'GitHub Actions'],
    link: 'https://github.com/andrasat/andrasat-com'
  },
  {
    name: 'aoc',
    description: 'Advent of Code solutions in multiple languages, mostly OCaml — an excuse to explore beyond day-to-day stacks.',
    stack: ['OCaml', 'Algorithms'],
    link: 'https://github.com/andrasat/aoc'
  }
]
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto animate-fade-in">
      <div class="mb-12">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-4">
          Projects & <span class="text-aero">Experiments</span>
        </h2>
        <p class="text-gray-400 max-w-lg">
          Things I build outside of work — some shipped, some in the lab.
        </p>
      </div>

      <section class="mb-16" aria-labelledby="now-building">
        <h3 id="now-building" class="text-sm font-mono text-gray-400 uppercase tracking-widest mb-6 flex items-center gap-2">
          <PhHammer :size="16" class="text-coral" /> Now Building
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
          <div
            v-for="project in nowBuilding"
            :key="project.name"
            class="group p-6 rounded-2xl bg-gray-800/40 border border-gray-700/50 hover:border-coral/50 hover:bg-gray-800/60 transition-all duration-300 flex flex-col"
          >
            <div class="flex justify-between items-center mb-4">
              <span class="text-xs font-mono font-bold text-coral uppercase tracking-widest bg-coral/10 px-2 py-1 rounded">
                In Development
              </span>
            </div>
            <h4 class="text-xl font-bold text-white mb-1 group-hover:text-coral transition-colors">
              {{ project.name }}
            </h4>
            <p class="text-sm font-mono text-gray-500 mb-3">{{ project.tagline }}</p>
            <p class="text-gray-400 text-sm leading-relaxed flex-1">
              {{ project.description }}
            </p>
            <div class="mt-6 flex flex-wrap gap-2">
              <span
                v-for="tech in project.stack"
                :key="tech"
                class="text-xs font-mono text-aero bg-gray-800 px-2 py-1 rounded"
              >
                {{ tech }}
              </span>
            </div>
          </div>
        </div>
      </section>

      <section aria-labelledby="selected-works">
        <h3 id="selected-works" class="text-sm font-mono text-gray-400 uppercase tracking-widest mb-6 flex items-center gap-2">
          <PhGithubLogo :size="16" class="text-aero" /> Selected Works
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
          <a
            v-for="project in selectedWorks"
            :key="project.name"
            :href="project.link ?? undefined"
            target="_blank"
            rel="noopener noreferrer"
            class="group p-6 rounded-2xl bg-gray-800/40 border border-gray-700/50 hover:border-aero/50 hover:bg-gray-800/60 transition-all duration-300 flex flex-col"
          >
            <div class="flex justify-between items-center mb-4">
              <h4 class="text-xl font-bold text-white group-hover:text-aero transition-colors">
                {{ project.name }}
              </h4>
              <PhGithubLogo :size="20" class="text-gray-500 group-hover:text-aero group-hover:scale-110 transition-all" />
            </div>
            <p class="text-gray-400 text-sm leading-relaxed flex-1">
              {{ project.description }}
            </p>
            <div class="mt-6 flex flex-wrap gap-2">
              <span
                v-for="tech in project.stack"
                :key="tech"
                class="text-xs font-mono text-aero bg-gray-800 px-2 py-1 rounded"
              >
                {{ tech }}
              </span>
            </div>
          </a>
        </div>

        <div class="mt-12 text-center">
          <TextLink href="https://github.com/andrasat" class="font-mono text-sm uppercase tracking-widest">
            More experiments on GitHub →
          </TextLink>
        </div>
      </section>
    </div>
  </PageContainer>
</template>
