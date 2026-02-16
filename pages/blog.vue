<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Blog',
  description: 'Thoughts on software engineering, technology, and life.'
})

const posts = [
  {
    title: 'Building Scalable Full-Stack Applications in 2024',
    excerpt: 'Exploring the latest trends and best practices for modern web development.',
    date: 'Oct 24, 2024',
    category: 'Engineering',
    readTime: '5 min'
  },
  {
    title: 'Why I Switched to Nuxt 3 for my Portfolio',
    excerpt: 'A deep dive into the performance benefits and developer experience of Nuxt 3.',
    date: 'Sep 12, 2024',
    category: 'Web Dev',
    readTime: '3 min'
  },
  {
    title: 'The Art of Remote Work: Staying Productive',
    excerpt: 'Tips and tricks for maintaining a healthy work-life balance while working from anywhere.',
    date: 'Aug 05, 2024',
    category: 'Lifestyle',
    readTime: '4 min'
  }
]
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto">
      <div class="mb-12">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-4">
          Writings & <span class="text-aero">Insights</span>
        </h2>
        <p class="text-gray-400 max-w-lg">
          Sharing my thoughts on development, technology, and everything in between.
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div 
          v-for="post in posts" 
          :key="post.title"
          class="group p-6 rounded-2xl bg-gray-800/40 border border-gray-700/50 hover:border-aero/50 hover:bg-gray-800/60 transition-all duration-300 flex flex-col justify-between"
        >
          <div>
            <div class="flex justify-between items-center mb-4">
              <span class="text-xs font-mono font-bold text-coral uppercase tracking-widest bg-coral/10 px-2 py-1 rounded">
                {{ post.category }}
              </span>
              <span class="text-xs text-gray-500 font-mono">{{ post.readTime }} read</span>
            </div>
            <h3 class="text-xl font-bold text-white mb-3 group-hover:text-aero transition-colors">
              {{ post.title }}
            </h3>
            <p class="text-gray-400 text-sm leading-relaxed line-clamp-2">
              {{ post.excerpt }}
            </p>
          </div>
          
          <div class="mt-6 flex items-center justify-between">
            <span class="text-xs text-gray-500">{{ post.date }}</span>
            <span class="text-aero text-sm font-bold opacity-0 group-hover:opacity-100 transition-opacity">
              Read More →
            </span>
          </div>
        </div>
      </div>

      <!-- Maintenance Footer -->
      <div class="mt-20 p-8 rounded-2xl border border-dashed border-gray-700 text-center bg-gray-900/50">
        <p class="text-gray-500 font-mono italic">
          More articles coming soon. I'm currently migrating my old blog posts here...
        </p>
      </div>
    </div>
  </PageContainer>
</template>
