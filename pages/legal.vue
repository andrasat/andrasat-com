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

      <div class="divide-y divide-gray-800">
        <NuxtLink
          v-for="(page, index) in legalPages"
          :key="page.to"
          :to="page.to"
          :aria-label="`${page.title} — ${page.description}`"
          class="group flex flex-col md:flex-row md:items-center gap-3 md:gap-8 py-6 first:pt-0 last:pb-0 hover:bg-gray-800/20 -mx-4 px-4 rounded-lg transition-colors duration-200"
        >
          <span class="font-mono text-sm text-gray-600 w-6 shrink-0" aria-hidden="true">
            {{ String(index + 1).padStart(2, '0') }}
          </span>
          <div class="flex-1 min-w-0">
            <h3 class="text-lg font-bold text-white group-hover:text-aero transition-colors mb-1">
              {{ page.title }}
            </h3>
            <p class="text-sm text-gray-400 leading-relaxed">
              {{ page.description }}
            </p>
          </div>
          <span class="text-aero text-sm font-bold group-hover:translate-x-1 transition-transform shrink-0" aria-hidden="true">
            View →
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
