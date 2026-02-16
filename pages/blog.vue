<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Blog',
  description: 'Thoughts on software engineering, technology, and life.'
})

// Fetch blog posts from @nuxt/content
const { data: posts } = await useAsyncData('blog-posts', () => 
  queryContent('/blog')
    .sort({ date: -1 }) // Sort by date descending
    .find()
)

function formatDate (dateString: string) {
  return new Date(dateString).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  })
}
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

      <div v-if="posts && posts.length" class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <NuxtLink 
          v-for="post in posts" 
          :key="post._path"
          :to="post._path"
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
              {{ post.description }}
            </p>
          </div>
          
          <div class="mt-6 flex items-center justify-between">
            <span class="text-xs text-gray-500">{{ formatDate(post.date) }}</span>
            <span class="text-aero text-sm font-bold group-hover:translate-x-1 transition-transform">
              Read More →
            </span>
          </div>
        </NuxtLink>
      </div>

      <div v-else class="text-center py-20 border border-dashed border-gray-700 rounded-2xl">
        <p class="text-gray-500 font-mono">No posts found yet. Check back soon!</p>
      </div>

      <!-- Maintenance Footer -->
      <div v-if="posts && posts.length" class="mt-20 p-8 rounded-2xl border border-dashed border-gray-700 text-center bg-gray-900/50">
        <p class="text-gray-500 font-mono italic">
          More articles coming soon. I'm currently migrating my old blog posts here...
        </p>
      </div>
    </div>
  </PageContainer>
</template>
