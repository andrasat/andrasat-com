<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Projects',
  description: 'Projects and experiments by Andra Satria — from full-stack apps to systems programming.'
})

const nowBuilding = [
  {
    name: 'Yifa',
    tagline: 'Your Financial Assistant',
    status: 'Coming soon',
    description: 'A privacy-first personal finance tracker with AI-powered insights that helps users understand spending and build healthier financial habits without handing over bank credentials.',
    link: 'https://yifa.id',
    stack: ['Kotlin', 'Android']
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

      <section class="mt-[4.5rem]" aria-labelledby="now-building">
        <h2 id="now-building" class="text-[clamp(1.75rem,4vw,3rem)] font-semibold leading-[1.05] tracking-tight text-ink text-balance">
          Now Building
        </h2>

        <div class="mt-6 border-t border-rule">
          <article
            v-for="project in nowBuilding"
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
                Visit yifa.id →
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
