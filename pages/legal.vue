<script setup lang="ts">
useSeoMeta({
  title: 'andrasat - Legal',
  description: 'Legal documents for Yifa and related services by Andra Satria.'
})

const legalPages = [
  {
    title: 'Privacy Policy',
    description: 'How data is collected, used, stored, and protected.',
    to: '/privacy-policy'
  },
  {
    title: 'Terms of Service',
    description: 'Rules and responsibilities for using the app and website.',
    to: '/terms-of-service'
  },
  {
    title: 'Compliance Notice',
    description: 'Service classification, operational scope, and legal contact.',
    to: '/compliance'
  },
  {
    title: 'Data Deletion Request',
    description: 'How to request account-linked data deletion.',
    to: '/data-deletion'
  }
]
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto animate-fade-in">
      <div class="mb-10">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-3">
          Legal <span class="text-aero">Center</span>
        </h2>
        <p class="text-gray-400 max-w-2xl">
          Official legal pages for Yifa and related services published by Andra Satria.
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <NuxtLink
          v-for="page in legalPages"
          :key="page.to"
          :to="page.to"
          class="group p-6 rounded-2xl bg-gray-800/40 border border-gray-700/50 hover:border-aero/50 hover:bg-gray-800/60 transition-all duration-300"
        >
          <h3 class="text-xl font-bold text-white mb-2 group-hover:text-aero transition-colors">
            {{ page.title }}
          </h3>
          <p class="text-sm text-gray-400 leading-relaxed mb-4">
            {{ page.description }}
          </p>
          <span class="text-aero text-sm font-bold group-hover:translate-x-1 transition-transform inline-block">
            Open →
          </span>
        </NuxtLink>
      </div>

      <div class="mt-10 p-5 rounded-2xl border border-dashed border-gray-700 bg-gray-900/50">
        <p class="text-sm text-gray-400 leading-relaxed">
          For legal and privacy inquiries, contact
          <a class="text-aero font-semibold hover:underline" href="mailto:admin@andrasat.com">admin@andrasat.com</a>.
        </p>
      </div>
    </div>
  </PageContainer>
</template>
