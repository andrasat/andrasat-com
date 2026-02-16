<script setup lang="ts">
const route = useRoute()
const { data: post } = await useAsyncData(`post-${route.path}`, () => 
  queryContent(route.path).findOne()
)

if (!post.value) {
  throw createError({ statusCode: 404, statusMessage: 'Post Not Found' })
}

useSeoMeta({
  title: `${post.value.title} - andrasat`,
  description: post.value.description
})
</script>

<template>
  <PageContainer>
    <div v-if="post" class="max-w-3xl mx-auto animate-fade-in">
      <NuxtLink 
        to="/blog" 
        class="inline-flex items-center text-sm font-mono text-gray-500 hover:text-aero mb-8 transition-colors group"
      >
        <span class="mr-2 group-hover:-translate-x-1 transition-transform">←</span> Back to Blog
      </NuxtLink>

      <header class="mb-12">
        <div class="flex items-center gap-4 mb-4">
          <span class="text-xs font-mono font-bold text-coral uppercase tracking-widest bg-coral/10 px-2 py-1 rounded">
            {{ post.category }}
          </span>
          <span class="text-sm text-gray-500 font-mono">
            {{ new Date(post.date).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) }}
          </span>
        </div>
        <h1 class="text-4xl md:text-5xl font-bold text-white tracking-tight mb-6">
          {{ post.title }}
        </h1>
        <div class="flex items-center text-gray-400 text-sm font-mono">
          <span>Estimated read: {{ post.readTime }}</span>
        </div>
      </header>

      <div class="prose prose-invert prose-aero max-w-none prose-headings:text-white prose-a:text-aero prose-strong:text-white prose-code:text-coral">
        <ContentRenderer :value="post" />
      </div>

      <footer class="mt-20 pt-10 border-t border-gray-800">
        <div class="flex flex-col md:flex-row justify-between items-center gap-6">
          <div class="flex items-center group">
            <img src="~/assets/images/andrasat_icon.png" alt="Andra Satria" class="w-12 h-12 rounded-full mr-4 border border-gray-700 group-hover:border-aero transition-colors">
            <div>
              <p class="text-white font-bold">Andra Satria</p>
              <p class="text-gray-500 text-sm">Senior Full Stack Developer</p>
            </div>
          </div>
          <TextLink href="https://twitter.com/andrasat" class="text-sm">
            Share on Twitter
          </TextLink>
        </div>
      </footer>
    </div>
  </PageContainer>
</template>

<style>
/* Custom prose styles to match the site's aesthetic */
.prose h2 {
  @apply text-2xl font-bold mt-12 mb-6 border-b border-gray-800 pb-2;
}
.prose p {
  @apply text-gray-300 leading-relaxed mb-6;
}
.prose ul {
  @apply list-disc list-inside mb-6 space-y-2;
}
.prose li {
  @apply text-gray-300;
}
.prose strong {
  @apply text-white;
}
.prose blockquote {
  @apply border-l-4 border-aero pl-4 italic text-gray-400;
}
</style>
