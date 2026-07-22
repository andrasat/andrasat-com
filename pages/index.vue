<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Senior Full Stack Developer',
  ogTitle: 'andrasat',
  description: 'Personal website of Andra Satria, Senior Full Stack Developer',
  ogDescription: 'Personal website of Andra Satria, Senior Full Stack Developer'
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
  <PageContainer>
    <article class="grid gap-16 md:gap-[4.5rem]">
      <section class="grid gap-6 border-b border-rule pb-10 md:grid-cols-[minmax(0,1.6fr)_minmax(12rem,0.8fr)] md:items-end">
        <div class="min-w-0 space-y-6">
          <h1 class="max-w-3xl text-[clamp(2.5rem,7vw,5.75rem)] font-semibold leading-[0.98] tracking-[-0.045em] text-ink text-balance">
            Hello World!, My name is Andra Satria.
          </h1>
        </div>

        <aside class="grid min-w-0 gap-4 border-t border-rule pt-4" aria-label="Current role and experience">
          <p class="max-w-[66ch] text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
            Now working remotely at
            <TextLink href="https://jitera.com/">Jitera</TextLink>
            as Senior Full Stack Developer.
          </p>
          <p class="max-w-[66ch] text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
            I am a software engineer with <strong class="font-semibold text-ink">{{ yoe }}+ years</strong> of experience in crafting robust web applications.
          </p>
        </aside>
      </section>

      <section class="grid gap-6" aria-labelledby="capabilities-heading">
        <div class="grid max-w-[66ch] gap-2">
          <h2 id="capabilities-heading" class="text-[clamp(1.75rem,4vw,3rem)] font-semibold leading-[1.05] tracking-[-0.03em] text-ink text-balance">
            Building products from 0 to 1.
          </h2>
          <p class="text-[clamp(0.9375rem,1.4vw,1.0625rem)] leading-[1.8] text-muted text-pretty">
            I specialize in building products from 0 to 1, optimizing performance, and simplifying complex systems to deliver exceptional user experiences.
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
    </article>
  </PageContainer>
</template>
