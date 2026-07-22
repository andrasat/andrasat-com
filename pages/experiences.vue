<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Professional Experience',
  description: 'Work history and professional journey of Andra Satria.'
})

const experiences = [
  {
    companyName: 'Jitera',
    companyShortUrl: 'jitera.com',
    companyUrl: 'https://jitera.com/',
    role: 'Senior Full Stack Developer',
    startDate: new Date('2024-04-05T00:00:00+07:00'),
    endDate: null,
    description: 'Leading full-stack development initiatives, optimizing core systems, and delivering high-quality products from concept to launch.'
  },
  {
    companyName: 'Base',
    companyShortUrl: 'base.co.id',
    companyUrl: 'https://www.base.co.id',
    role: 'Senior Full Stack Developer',
    startDate: new Date('2019-11-01T00:00:00+07:00'),
    endDate: new Date('2024-04-05T00:00:00+07:00'),
    description: 'Developed and maintained core e-commerce features, improved platform scalability, and mentored junior developers.'
  },
  {
    companyName: 'Lifepal',
    companyShortUrl: 'lifepal.co.id',
    companyUrl: 'https://lifepal.co.id/',
    role: 'Software Engineer',
    startDate: new Date('2019-04-01T00:00:00+07:00'),
    endDate: new Date('2019-10-01T00:00:00+07:00'),
    description: 'Contributed to insurance platform development, focusing on frontend performance and user acquisition funnels.'
  },
  {
    companyName: 'YouExpress',
    companyShortUrl: 'youexpress.co.id',
    companyUrl: 'https://youexpress.co.id/',
    role: 'Full Stack Engineer',
    startDate: new Date('2018-06-01T00:00:00+07:00'),
    endDate: new Date('2019-04-01T00:00:00+07:00'),
    description: 'Built logistics and shipping solutions, managing both frontend interfaces and backend APIs.'
  },
  {
    companyName: 'RebelWorks',
    companyShortUrl: 'rebelworks.co',
    companyUrl: 'https://www.rebelworks.co/',
    role: 'Junior Developer',
    startDate: new Date('2017-07-01T00:00:00+07:00'),
    endDate: new Date('2018-05-01T00:00:00+07:00'),
    description: 'Started professional journey by working on various client projects, learning modern web standards and best practices.'
  }
]
</script>

<template>
  <PageContainer>
    <section class="mx-auto max-w-3xl" aria-labelledby="experience-heading">
      <header class="mb-[4.5rem] flex flex-col gap-4 md:flex-row md:items-baseline md:justify-between">
        <h1 id="experience-heading" class="text-4xl font-semibold tracking-tight text-ink md:text-5xl">
          Professional Journey
        </h1>
        <TextLink href="https://www.linkedin.com/in/andrasat/" class="inline-flex min-h-11 items-center text-sm font-medium">
          View LinkedIn →
        </TextLink>
      </header>

      <ol class="border-t border-rule">
        <li
          v-for="experience in experiences"
          :key="experience.companyName"
          class="grid min-w-0 gap-4 border-b border-rule py-6 md:grid-cols-[9rem_minmax(0,1fr)] md:gap-6"
        >
          <p class="text-xs font-semibold tracking-wide text-muted">
            {{ formatDate(experience.startDate) }} — {{ experience.endDate ? formatDate(experience.endDate) : 'Present' }}
          </p>
          <div class="min-w-0 space-y-4">
            <div class="space-y-1">
              <h2 class="text-base font-semibold leading-[1.35] text-ink">
                {{ experience.role }}
              </h2>
              <TextLink :href="experience.companyUrl" class="text-sm font-semibold">
                {{ experience.companyName }}
              </TextLink>
            </div>
            <p class="max-w-[66ch] text-sm leading-7 text-muted">
              {{ experience.description }}
            </p>
          </div>
        </li>
      </ol>
    </section>
  </PageContainer>
</template>
