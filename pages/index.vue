<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Senior Full Stack Developer',
  ogTitle: 'andrasat',
  description: 'Personal website of Andra Satria, Senior Full Stack Developer',
  ogDescription: 'Personal website of Andra Satria, Senior Full Stack Developer'
})

const START_DEV_WORK = new Date('2017-07-01T00:00:00.000+07:00')
const NOW = new Date()
const yoe = Math.floor((NOW.getTime() - START_DEV_WORK.getTime()) / (1000 * 3600 * 24 * 365))

const typedText = ref('')
const fullText = 'Hello World!, My name is Andra Satria.'
const typingSpeed = 100

onMounted(() => {
  let i = 0
  const typeWriter = () => {
    if (i < fullText.length) {
      typedText.value += fullText.charAt(i)
      i++
      setTimeout(typeWriter, typingSpeed)
    }
  }
  typeWriter()
})

const skillCategories = [
  {
    name: 'Languages',
    icons: [
      { class: 'devicon-typescript-plain colored', name: 'TypeScript' },
      { class: 'devicon-javascript-plain colored', name: 'JavaScript' },
      { class: 'devicon-go-plain colored', name: 'Go' },
      { class: 'devicon-rust-plain', name: 'Rust' }
    ]
  },
  {
    name: 'Frameworks & Tools',
    icons: [
      { class: 'devicon-nextjs-line', name: 'Next.js' },
      { class: 'devicon-react-original colored', name: 'React' },
      { class: 'devicon-nodejs-plain colored', name: 'Node.js' },
      { class: 'devicon-nestjs-plain colored', name: 'NestJS' },
      { class: 'devicon-nuxtjs-plain colored', name: 'Nuxt.js' },
      { class: 'devicon-docker-plain colored', name: 'Docker' },
      { class: 'devicon-kubernetes-plain colored', name: 'Kubernetes' }
    ]
  },
  {
    name: 'Cloud & DB',
    icons: [
      { class: 'devicon-googlecloud-plain colored', name: 'GCP' },
      { class: 'devicon-postgresql-plain colored', name: 'PostgreSQL' },
      { class: 'devicon-mysql-plain colored', name: 'MySQL' },
      { class: 'devicon-mongodb-plain colored', name: 'MongoDB' },
      { class: 'devicon-amazonwebservices-plain-wordmark colored', name: 'AWS' }
    ]
  }
]
</script>

<template>
  <PageContainer>
    <div class="flex flex-col items-center md:items-start space-y-8 animate-fade-in">
      <div class="min-h-[60px]">
        <h2 class="text-3xl md:text-5xl font-mono font-bold text-white tracking-tighter">
          {{ typedText }}<span class="animate-pulse text-aero">_</span>
        </h2>
      </div>

      <div class="max-w-2xl space-y-6 text-lg leading-relaxed">
        <p>
          Now working remotely at 
          <a rel="noopener noreferrer" href="https://jitera.com/" target="_blank" class="text-aero font-bold hover:underline decoration-2 underline-offset-4 transition-all">
            Jitera
          </a> 
          as <span class="text-coral font-semibold italic">Senior Full Stack Developer</span>.
        </p>
        
        <p>
          I am a software engineer with <span class="text-white font-bold">{{ yoe }}+ years</span> of experience in crafting robust web applications.
          I specialize in building products from <span class="bg-gray-800 px-1 rounded text-aero">0 to 1</span>, 
          optimizing performance, and simplifying complex systems to deliver exceptional user experiences.
        </p>
      </div>

      <div class="w-full grid grid-cols-1 md:grid-cols-3 gap-6 mt-12">
        <div v-for="cat in skillCategories" :key="cat.name" class="p-6 rounded-2xl bg-gray-800/40 border border-gray-700/50 hover:border-aero/50 hover:bg-gray-800/60 transition-all duration-300 group">
          <h3 class="text-sm font-mono text-gray-400 uppercase tracking-widest mb-4 group-hover:text-aero transition-colors">
            {{ cat.name }}
          </h3>
          <div class="flex flex-wrap gap-4 text-3xl">
            <i 
              v-for="icon in cat.icons" 
              :key="icon.name" 
              :class="[icon.class, 'hover:scale-125 transition-transform duration-200 cursor-help']"
              :title="icon.name"
            />
          </div>
        </div>
      </div>

      <div class="w-full text-center mt-20 opacity-60 hover:opacity-100 transition-opacity">
        <p class="text-sm font-mono">
          Handcrafted with 
          <span class="text-aero">Nuxt</span> 
          <i class="devicon-nuxtjs-plain colored mx-1" />
          & 
          <span class="text-coral">TailwindCSS</span>
          <i class="devicon-tailwindcss-original colored mx-1" />
        </p>
      </div>
    </div>
  </PageContainer>
</template>

<style scoped>
.colored {
  filter: grayscale(0.2) contrast(1.1);
}
.colored:hover {
  filter: grayscale(0) contrast(1.2);
}
</style>
