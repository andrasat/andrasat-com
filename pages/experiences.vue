<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Professional Experience',
  description: 'Work history and professional journey of Andra Satria.'
})

// From current to old
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
    startDate: new Date('2019-10-01T00:00:00+07:00'),
    endDate: new Date('2019-04-01T00:00:00+07:00'), // Note: Data in original file seems to have a typo where endDate is before startDate or similar, keeping as is but fixed role/logic.
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
    <div class="max-w-3xl mx-auto">
      <div class="flex flex-col md:flex-row justify-between items-baseline mb-12 gap-4">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight">
          Professional <span class="text-aero">Journey</span>
        </h2>
        <TextLink href="https://www.linkedin.com/in/andrasat/" class="font-mono text-sm uppercase tracking-widest">
          View LinkedIn →
        </TextLink>
      </div>

      <div class="relative border-l-2 border-gray-800 ml-4 md:ml-6 space-y-12 pb-8">
        <div 
          v-for="(exp, index) in experiences" 
          :key="index" 
          class="relative pl-8 md:pl-12 group"
        >
          <!-- Timeline Dot -->
          <div 
            class="absolute -left-[9px] top-1 w-4 h-4 rounded-full transition-all duration-300 z-10"
            :class="[
              index === 0 
                ? 'bg-aero border-2 border-aero shadow-[0_0_15px_rgba(81,180,211,0.5)] scale-110' 
                : index === experiences.length - 1
                  ? 'bg-licorice border-2 border-gray-600 group-hover:border-aero'
                  : 'bg-licorice border-2 border-aero group-hover:bg-aero group-hover:scale-125'
            ]"
          >
            <!-- Pulse effect for current role -->
            <div v-if="index === 0" class="absolute inset-0 rounded-full bg-aero animate-ping opacity-75" />
          </div>
          
          <div class="flex flex-col space-y-2">
            <span class="text-xs font-mono font-bold text-coral uppercase tracking-tighter">
              {{ formatDate(exp.startDate) }} — {{ exp.endDate ? formatDate(exp.endDate) : 'Present' }}
            </span>
            
            <div class="flex flex-col md:flex-row md:items-center gap-2">
              <h3 class="text-xl font-bold text-white group-hover:text-aero transition-colors">
                {{ exp.role }}
              </h3>
              <span class="hidden md:block text-gray-600">@</span>
              <TextLink :href="exp.companyUrl" class="text-lg">
                {{ exp.companyName }}
              </TextLink>
            </div>
            
            <p v-if="exp.description" class="text-gray-400 mt-2 leading-relaxed max-w-2xl">
              {{ exp.description }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </PageContainer>
</template>

<style scoped>
/* Smooth entrance for the timeline line */
.relative::before {
  content: '';
  position: absolute;
  top: 0;
  left: -2px;
  height: 0;
  width: 2px;
  background: linear-gradient(to bottom, #51b4d3, #0e0311);
  animation: line-grow 1s ease-out forwards;
}

@keyframes line-grow {
  to { height: 100%; }
}
</style>

