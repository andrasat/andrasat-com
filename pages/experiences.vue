<script setup lang="ts">
// From current to old
const experiences = [
  {
    companyName: 'Base',
    companyShortUrl: 'base.co.id',
    companyUrl: 'https://www.base.co.id',
    role: 'Senior Full Stack Developer',
    startDate: new Date('2019-11-01T00:00:00+07:00'),
    endDate: new Date('2024-04-05T00:00:00+07:00')
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
      <li v-for="(experience, index) in experiences" :key="index" :class="{'relative': true, 'py-1':true, 'md:p-4': true, 'last-li': index === experiences.length - 1}">
        <div class="flex">
          <VerticalLine height="100%" class="triangle" />
          <p class="flex-auto pl-4">
            {{ experience.companyName }} - <TextLink :href="experience.companyUrl">
              {{ experience.companyShortUrl }}
            </TextLink>
          </p>
        </div>
        <div class="flex">
          <span />
          <p class="flex-auto mt-2 pl-4">
            {{ experience.role }}
          </p>
        </div>
        <div class="flex">
          <span />
          <p class="flex-auto mt-1 pl-4">
            {{ formatDate(experience.startDate) }} - {{ experience.endDate ? formatDate(experience.endDate) : 'Current' }}
          </p>
        </div>
      </li>
    </ul>
  </PageContainer>
</template>

<style>
  .last-li {
    position: relative;
  }

  .last-li::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    height: 0.5px;
    width: 100%;
    background-color: white;
  }

  .triangle::after {
    content: '';
    position: absolute;
    top: 1px;
    height: 0px;
    width: 0px;
    border-left: 10px solid white;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
  }
</style>
