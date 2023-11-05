<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Home',
  ogTitle: 'andrasat',
  description: 'My personal website',
  ogDescription: 'My personal website'
})

const START_DEV_WORK = new Date('2017-07-01')
const NOW = new Date()
const yoe = new Date(NOW.getTime() - START_DEV_WORK.getTime()).getFullYear()

</script>

<template>
  <PageContainer>
    <p class="max-w-lg">
      Hello World!, My name is Andra Satria. Currently I'm working as a Senior Full Stack Developer at
      <a ref="noopener noreferrer" href="https://www.base.co.id" target="_blank" class="text-blue-600">BASE</a>.
    </p>
    <p class="mt-6 max-w-lg">
      I am a software engineer with {{ yoe }}+ years of experience in developing web apps.
      I have a passion for creating innovative solutions that solve real-world problems and enhance user experience.
      I have worked with various technologies and frameworks, such as below. I am always eager to learn new skills and explore new challenges.
    </p>

    <!-- Languages -->
    <section class="flex flex-row justify-between lg:justify-start mt-6">
      <p class="lg:w-[100px]">
        Languages:
      </p>
      <div>
        <img alt="typescript" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-plain.svg" width="30" height="30" class="inline ml-3">
        <img alt="javascript" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-plain.svg" width="30" height="30" class="inline ml-3">
        <img alt="go" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/go/go-original-wordmark.svg" width="30" height="30" class="inline ml-3">
        <nuxt-icon name="rust" class="custom-icon w-[30px] h-[30px] inline ml-3" />
      </div>
    </section>

    <!-- Tools -->
    <section class="flex flex-row justify-between lg:justify-start mt-12">
      <p class="lg:w-[100px]">
        Tools:
      </p>
      <div class="flex flex-row flex-wrap justify-end w-[200px] lg:w-auto h-auto">
        <nuxt-icon name="nextjs" class="custom-icon w-[40px] h-[40px] inline ml-3 p-1" />
        <img alt="react" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="nodejs" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="nestjs" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nestjs/nestjs-plain.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="nuxtjs" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nuxtjs/nuxtjs-original.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="docker" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-plain.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="kubernetes" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="google cloud" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg" width="40" height="40" class="inline ml-3 p-1">
        <img alt="amazon web service" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original.svg" width="40" height="40" class="inline ml-3 p-1">
      </div>
    </section>

    <!-- Databases -->
    <section class="flex flex-row justify-between lg:justify-start mt-12">
      <p class="lg:w-[100px]">
        Databases:
      </p>
      <div class="float-right">
        <img alt="postgresql" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" width="30" height="30" class="inline ml-3">
        <img alt="mysql" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" width="30" height="30" class="inline ml-3">
        <img alt="mongodb" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg" width="30" height="30" class="inline ml-3">
      </div>
    </section>

    <p class="text-center mt-24">
      This website is made with
      <br>
      NuxtJS{{ '\xa0' }}<img alt="nuxtjs" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nuxtjs/nuxtjs-original.svg" width="24" height="24" class="inline ml-2 mr-2">
      &amp;
      TailwindCSS{{ '\xa0' }}<img alt="tailwindcss" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/tailwindcss/tailwindcss-plain.svg" width="24" height="24" class="inline ml-2 mr-2">
    </p>
  </PageContainer>
</template>

<style>
.custom-icon svg {
  height: 30px;
  width: 30px;
  display: inline;
  margin-bottom: 0;
}
</style>
