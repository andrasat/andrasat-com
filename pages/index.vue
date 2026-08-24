<script setup lang="ts">
const SITE_URL = 'https://andrasat.com'

useSeoMeta({
  title: 'Andra Satria — Senior Full Stack Developer',
  ogTitle: 'Andra Satria — Senior Full Stack Developer',
  description: 'Andra Satria — Senior Full Stack Developer building products from 0 to 1. Currently working remotely at Jitera.',
  ogDescription: 'Andra Satria — Senior Full Stack Developer building products from 0 to 1. Currently working remotely at Jitera.',
  ogType: 'website',
  ogUrl: `${SITE_URL}/`,
  ogImage: `${SITE_URL}/og-image.png`,
  twitterCard: 'summary_large_image',
  twitterTitle: 'Andra Satria — Senior Full Stack Developer',
  twitterDescription: 'Andra Satria — Senior Full Stack Developer building products from 0 to 1. Currently working remotely at Jitera.',
  twitterImage: `${SITE_URL}/og-image.png`
})

useHead({
  link: [
    { rel: 'canonical', href: `${SITE_URL}/` }
  ],
  script: [
    {
      type: 'application/ld+json',
      children: JSON.stringify({
        '@context': 'https://schema.org',
        '@type': 'Person',
        name: 'Andra Satria',
        url: `${SITE_URL}/`,
        jobTitle: 'Senior Full Stack Developer',
        worksFor: {
          '@type': 'Organization',
          name: 'Jitera',
          url: 'https://jitera.com/'
        },
        email: 'mailto:andra.satria1@gmail.com',
        sameAs: [
          'https://www.linkedin.com/in/andrasat/',
          'https://github.com/andrasat'
        ]
      })
    }
  ]
})

const START_DEV_WORK = new Date('2017-07-01T00:00:00.000+07:00')
const yoe = Math.floor((Date.now() - START_DEV_WORK.getTime()) / (1000 * 3600 * 24 * 365))

const skillCategories = [
  { id: 'languages', name: 'Languages', skills: ['TypeScript', 'JavaScript', 'Go', 'Rust'] },
  { id: 'frameworks-tools', name: 'Frameworks & Tools', skills: ['Next.js', 'React', 'Node.js', 'NestJS', 'Nuxt.js', 'Docker', 'Kubernetes'] },
  { id: 'cloud-db', name: 'Cloud & DB', skills: ['GCP', 'PostgreSQL', 'MySQL', 'MongoDB', 'AWS'] }
] as const
</script>

<template>
  <ProductEngine />

  <PageContainer>
    <article class="grid gap-16 md:gap-[4.5rem]">
      <section class="grid gap-6 md:grid-cols-[minmax(0,1.6fr)_minmax(12rem,0.8fr)] md:items-end">
        <div class="min-w-0">
          <h2 class="text-[clamp(1.75rem,4vw,3rem)] font-semibold leading-[1.05] tracking-[-0.03em] text-ink text-balance">
            Systems, from interface to infrastructure.
          </h2>
        </div>

        <aside class="grid min-w-0 gap-4 border-t border-rule pt-4" aria-label="Experience summary">
          <p class="max-w-[66ch] text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
            I am a software engineer with <strong class="font-semibold text-ink">{{ yoe }}+ years</strong> of experience in crafting robust web applications.
          </p>
        </aside>
      </section>

      <section class="grid gap-6" aria-labelledby="capabilities-heading">
        <div class="grid max-w-[66ch] gap-2">
          <h2 id="capabilities-heading" class="text-[clamp(1.75rem,4vw,3rem)] font-semibold leading-[1.05] tracking-[-0.03em] text-ink text-balance">
            What I work with
          </h2>
          <p class="text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
            I work across the full stack — typed frontends in TypeScript and React, APIs and services on Node.js and Go, deployed to the cloud.
          </p>
        </div>

        <div class="grid gap-4 md:grid-cols-3" aria-label="Capability index">
          <section v-for="category in skillCategories" :key="category.id" class="grid gap-3 border-t border-rule pt-4" :aria-labelledby="`skill-${category.id}`">
            <h3 :id="`skill-${category.id}`" class="text-base font-semibold leading-snug text-ink">
              {{ category.name }}
            </h3>
            <ul class="flex flex-wrap content-start items-start gap-2" role="list">
              <li v-for="skill in category.skills" :key="skill" class="rounded-lg border border-control px-2 py-1 text-xs font-medium leading-snug text-muted">
                {{ skill }}
              </li>
            </ul>
          </section>
        </div>
      </section>

      <section class="grid gap-6 md:grid-cols-2 md:gap-10" aria-label="Where to look next">
        <article class="grid min-w-0 gap-3 border-t border-rule pt-4">
          <h2 class="text-base font-semibold leading-snug text-ink">Now building</h2>
          <p class="text-sm leading-7 text-muted">
            Yifa — a privacy-first personal finance tracker with AI-powered insights. Coming soon.
          </p>
          <NuxtLink to="/projects" class="inline-flex min-h-11 items-center text-sm font-medium text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">
            See projects →
          </NuxtLink>
        </article>
        <article class="grid min-w-0 gap-3 border-t border-rule pt-4">
          <h2 class="text-base font-semibold leading-snug text-ink">Experience</h2>
          <p class="text-sm leading-7 text-muted">
            Senior Full Stack Developer at Jitera — previously Base, Lifepal, YouExpress, and RebelWorks since 2017.
          </p>
          <NuxtLink to="/experiences" class="inline-flex min-h-11 items-center text-sm font-medium text-accent-ink underline decoration-current decoration-1 underline-offset-4 transition-[text-decoration-thickness] duration-150 ease-out hover:decoration-2 hover:underline-offset-2">
            View the journey →
          </NuxtLink>
        </article>
      </section>
    </article>
  </PageContainer>
</template>
