<script setup lang="ts">
// From current to old
const experiences = [
  {
    companyName: 'Base',
    companyShortUrl: 'base.co.id',
    companyUrl: 'https://www.base.co.id',
    role: 'Senior Full Stack Developer',
    startDate: new Date('2019-11-01T00:00:00+07:00'),
    endDate: null
  },
  {
    companyName: 'Lifepal',
    companyShortUrl: 'lifepal.co.id',
    companyUrl: 'https://lifepal.co.id/',
    role: 'Software Engineer',
    startDate: new Date('2019-10-01T00:00:00+07:00'),
    endDate: new Date('2019-04-01T00:00:00+07:00')
  },
  {
    companyName: 'YouExpress',
    companyShortUrl: 'youexpress.co.id',
    companyUrl: 'https://youexpress.co.id/',
    role: 'Full Stack Engineer',
    startDate: new Date('2018-06-01T00:00:00+07:00'),
    endDate: new Date('2019-04-01T00:00:00+07:00')
  },
  {
    companyName: 'RebelWorks',
    companyShortUrl: 'rebelworks.co',
    companyUrl: 'https://www.rebelworks.co/',
    role: 'Junior Developer',
    startDate: new Date('2017-07-01T00:00:00+07:00'),
    endDate: new Date('2018-05-01T00:00:00+07:00')
  }
]
</script>

<template>
  <PageContainer>
    <h2 class="text-lg">
      Experiences :
      (<TextLink href="https://www.linkedin.com/in/andrasat/">
        Linkedin
      </TextLink>)
    </h2>
    <ul>
      <li v-for="(experience, index) in experiences" :key="index" class="p-4">
        <VerticalLine />
        <p class="inline pl-4">
          {{ experience.companyName }} - <TextLink :href="experience.companyUrl">
            {{ experience.companyShortUrl }}
          </TextLink>
        </p>
        <p class="mt-2">
          {{ experience.role }}
        </p>
        <p class="mt-1">
          {{ formatDate(experience.startDate) }} - {{ experience.endDate ? formatDate(experience.endDate) : 'Current' }}
        </p>
      </li>
    </ul>
  </PageContainer>
</template>
