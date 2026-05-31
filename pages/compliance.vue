<script setup lang="ts">
useSeoMeta({
  title: 'Compliance Notice - Yifa',
  description: 'Compliance and service scope notice for Yifa by Andra Satria.'
})

const effectiveDate = 'May 31, 2026'
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto animate-fade-in">
      <div class="mb-8">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-3">
          Compliance <span class="text-aero">Notice</span>
        </h2>
        <p class="text-sm text-gray-400">
          Effective Date: {{ effectiveDate }}
        </p>
      </div>

      <article class="prose prose-invert max-w-none prose-p:text-gray-300 prose-li:text-gray-300 prose-headings:text-white prose-a:text-aero">
        <p>
          This notice clarifies service boundaries and operational compliance information for Yifa.
        </p>

        <h3>Operator Information</h3>
        <ul>
          <li><strong>Operator / Publisher:</strong> Andra Satria</li>
          <li><strong>Website:</strong> andrasat.com</li>
          <li><strong>Contact:</strong> <a href="mailto:admin@andrasat.com">admin@andrasat.com</a></li>
          <li><strong>Country / Region:</strong> Indonesia</li>
        </ul>

        <h3>Service Classification</h3>
        <p>
          Yifa is an independent personal finance tracking and insights application.
          It helps users record transactions and review financial patterns.
        </p>

        <h3>What Yifa Does Not Provide</h3>
        <ul>
          <li>Banking or wallet custody services</li>
          <li>Lending or credit underwriting</li>
          <li>Investment brokerage, trading, or portfolio management</li>
          <li>Guaranteed financial, tax, legal, or accounting advice</li>
        </ul>

        <h3>AI and Online Service Dependencies</h3>
        <p>
          Some features rely on internet connectivity and third-party infrastructure.
          AI-assisted outputs are informational and may vary in quality.
        </p>

        <h3>Reporting and Legal Contact</h3>
        <p>
          For privacy, legal, compliance, or abuse reports,
          email <a href="mailto:admin@andrasat.com">admin@andrasat.com</a>.
        </p>
      </article>

      <div class="mt-10 pt-6 border-t border-gray-800 flex flex-wrap gap-3">
        <NuxtLink class="text-sm text-aero hover:underline" to="/privacy-policy">Privacy Policy</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/terms-of-service">Terms of Service</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/data-deletion">Data Deletion Request</NuxtLink>
      </div>
    </div>
  </PageContainer>
</template>
