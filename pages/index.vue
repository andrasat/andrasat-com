<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Home',
  ogTitle: 'andrasat',
  description: 'My personal website',
  ogDescription: 'My personal website'
})

const START_DEV_WORK = new Date('2017-07-01T00:00:00.000+07:00')
const NOW = new Date()
const yoe = Math.floor((NOW.getTime() - START_DEV_WORK.getTime()) / (1000 * 3600 * 24 * 365))

</script>

<template>
  <PageContainer>
    <p class="max-w-lg">
      Hello World!, My name is Andra Satria. Currently I&apos;m working as a Senior Full Stack Developer at
      <a ref="noopener noreferrer" href="https://www.base.co.id" target="_blank" class="text-blue-600">BASE</a>.
    </p>
    <p class="mt-6 max-w-lg">
      I am a software engineer with {{ yoe }}+ years of experience in developing web apps.
      I have a passion building products from 0 to 1 that solve real-world problems, also I love optimizing performance, simplify things, and improving user experience.
    </p>
    <p class="mt-6 max-w-lg">
      I have worked with various technologies and frameworks such as below, and always eager to learn new skills and explore new challenges.
    </p>

    <!-- Languages -->
    <section class="flex flex-row justify-between lg:justify-start mt-6">
      <p class="lg:w-[100px]">
        Languages:
      </p>
      <div>
        <i class="devicon-typescript-plain colored ml-3" />
        <i class="devicon-javascript-plain colored ml-3" />
        <i class="devicon-go-original-wordmark colored ml-3" />
        <i class="devicon-rust-plain ml-3" />
      </div>
    </section>

    <!-- Tools -->
    <section class="flex flex-row justify-between lg:justify-start mt-12">
      <p class="lg:w-[100px]">
        Tools:
      </p>
      <div class="flex flex-row flex-wrap justify-end w-[200px] lg:w-auto h-auto">
        <i class="devicon-nextjs-line ml-3 p-1" />
        <i class="devicon-react-original colored ml-3 p-1" />
        <i class="devicon-nodejs-plain colored ml-3 p-1" />
        <i class="devicon-nestjs-plain colored ml-3 p-1" />
        <i class="devicon-nuxtjs-plain colored ml-3 p-1" />
        <i class="devicon-docker-plain colored ml-3 p-1" />
        <i class="devicon-kubernetes-plain colored ml-3 p-1" />
        <i class="devicon-googlecloud-plain colored ml-3 p-1" />
        <i class="devicon-amazonwebservices-original colored ml-3 p-1" />
      </div>
    </section>

    <!-- Databases -->
    <section class="flex flex-row justify-between lg:justify-start mt-12">
      <p class="lg:w-[100px]">
        Databases:
      </p>
      <div class="float-right">
        <i class="devicon-postgresql-plain colored ml-3" />
        <i class="devicon-mysql-plain colored ml-3" />
        <i class="devicon-mongodb-plain-wordmark colored ml-3" />
      </div>
    </section>

    <p class="text-center mt-24">
      This website is made with
      <br>
      NuxtJS&nbsp;<i class="devicon-nuxtjs-plain colored ml-2 mr-2" />
      &amp;
      TailwindCSS&nbsp;<i class="devicon-tailwindcss-plain colored ml-2 mr-2" />
    </p>
  </PageContainer>
</template>
