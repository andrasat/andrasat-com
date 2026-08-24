<script setup lang="ts">
const SITE_URL = 'https://andrasat.com'

useSeoMeta({
  title: 'Projects — Andra Satria',
  ogTitle: 'Projects — Andra Satria',
  description: 'Projects and experiments by Andra Satria — from full-stack apps to systems programming.',
  ogDescription: 'Projects and experiments by Andra Satria — from full-stack apps to systems programming.',
  ogType: 'website',
  ogUrl: `${SITE_URL}/projects`,
  ogImage: `${SITE_URL}/og-image.png`,
  twitterCard: 'summary_large_image',
  twitterTitle: 'Projects — Andra Satria',
  twitterDescription: 'Projects and experiments by Andra Satria — from full-stack apps to systems programming.',
  twitterImage: `${SITE_URL}/og-image.png`
})

useHead({
  link: [
    { rel: 'canonical', href: `${SITE_URL}/projects` }
  ]
})

const projects = [
  {
    name: 'Yifa',
    tagline: 'Income allocation and planning for Indonesian independent earners',
    status: 'In development',
    description: 'A privacy-first income allocation and planning system that helps users reserve tax, protect essentials, fund goals, and know what is safe to spend without handing over bank credentials.',
    link: 'https://yifa.id',
    stack: ['Kotlin', 'Android']
  },
  {
    name: 'pi-llm-self-verify',
    tagline: 'Independent solution selection for Pi',
    status: 'Release candidate',
    description: 'A Pi package that generates independent, read-only candidate solutions and selects the strongest with a fine-grained logprob verifier.',
    link: 'https://github.com/andrasat/pi-llm-self-verify',
    stack: ['TypeScript', 'Pi']
  },
  {
    name: 'Trade Bot',
    tagline: 'Algorithmic trading, on Telegram',
    status: 'Private project',
    description: 'A trading bot with a Telegram interface — market data ingestion, strategy execution, and backtesting.',
    link: null,
    stack: ['Python', 'Telegram API']
  }
] as const
</script>

<template>
  <PageContainer>
    <div class="max-w-5xl">
      <header class="max-w-[66ch] border-b border-rule pb-10 md:pb-[4.5rem]">
        <h1 class="text-[clamp(2.5rem,7vw,5.75rem)] font-semibold leading-[0.98] tracking-[-0.045em] text-ink text-balance">
          Projects &amp; Experiments
        </h1>
        <p class="mt-6 max-w-[66ch] text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
          Things I build outside of work — some shipped, some in the lab.
        </p>
      </header>

      <section class="mt-[4.5rem]" aria-labelledby="projects-heading">
        <h2 id="projects-heading" class="text-[clamp(1.75rem,4vw,3rem)] font-semibold leading-[1.05] tracking-tight text-ink text-balance">
          Projects
        </h2>

        <div class="mt-6 border-t border-rule">
          <article
            v-for="project in projects"
            :key="project.name"
            class="grid gap-6 border-b border-rule py-6 md:grid-cols-[minmax(10rem,0.65fr)_minmax(0,1.35fr)] md:gap-10"
          >
            <div>
              <h3 class="text-base font-semibold leading-[1.35] text-ink">
                {{ project.name }}
              </h3>
              <p class="mt-2 text-sm leading-7 text-muted">
                {{ project.tagline }}
              </p>
              <p class="mt-4 inline-block rounded-lg border border-control px-2 py-1 text-xs font-medium leading-[1.4] text-muted">
                {{ project.status }}
              </p>
            </div>

            <div>
              <p class="max-w-[66ch] text-sm leading-7 text-muted text-pretty">
                {{ project.description }}
              </p>
              <TextLink v-if="project.link" :href="project.link" class="mt-2 inline-flex min-h-11 items-center text-sm font-medium">
                Visit {{ project.name }} →
              </TextLink>
              <ul class="mt-6 flex flex-wrap gap-2" aria-label="Technologies">
                <li
                  v-for="technology in project.stack"
                  :key="technology"
                  class="rounded-lg border border-control px-2 py-1 text-xs font-medium leading-[1.4] text-muted"
                >
                  {{ technology }}
                </li>
              </ul>
            </div>
          </article>
        </div>
      </section>
    </div>
  </PageContainer>
</template>
