<script setup lang="ts">
useSeoMeta({
  title: 'Terms of Service - Yifa',
  description: 'Terms of Service for Yifa by Andra Satria.'
})

const effectiveDate = 'May 31, 2026'
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto animate-fade-in">
      <div class="mb-8">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-3">
          Terms of <span class="text-aero">Service</span>
        </h2>
        <p class="text-sm text-gray-400">
          Effective Date: {{ effectiveDate }}
        </p>
      </div>

      <article class="prose prose-invert max-w-none prose-p:text-gray-300 prose-li:text-gray-300 prose-headings:text-white prose-a:text-aero">
        <p>
          These Terms of Service govern your access to and use of Yifa and related services
          provided by Andra Satria (<strong>"we"</strong>, <strong>"us"</strong>, <strong>"our"</strong>).
          By using the service, you agree to these terms.
        </p>

        <h3>1. What Yifa Is</h3>
        <p>
          Yifa is a tracking and insights app for personal finance records. It is not a banking,
          lending, payment, investment, legal, accounting, or tax advisory service.
        </p>

        <h3>2. Eligibility and Responsibility</h3>
        <p>
          You are responsible for account credentials, data accuracy, and how you use outputs
          such as categorizations or summaries.
        </p>

        <h3>3. Acceptable Use</h3>
        <ul>
          <li>Do not misuse, disrupt, or attempt unauthorized access to services or infrastructure.</li>
          <li>Do not use the service for unlawful, fraudulent, or harmful activities.</li>
          <li>Do not upload malicious content or code.</li>
        </ul>

        <h3>4. Online Features and Dependencies</h3>
        <p>
          Some features depend on third-party services, internet connectivity, and AI systems.
          Availability, speed, and output quality may vary.
        </p>

        <h3>5. No Financial Advice</h3>
        <p>
          Any insights, categorizations, summaries, or calculations are informational only.
          You remain fully responsible for financial decisions.
        </p>

        <h3>6. Intellectual Property</h3>
        <p>
          Yifa branding, software, and content are owned by or licensed to Andra Satria,
          except where otherwise stated.
        </p>

        <h3>7. Service Changes</h3>
        <p>
          We may update, modify, suspend, or discontinue features at any time for product,
          operational, security, or legal reasons.
        </p>

        <h3>8. Disclaimer of Warranties</h3>
        <p>
          The service is provided "as is" and "as available" to the extent permitted by law.
          We do not guarantee uninterrupted availability, error-free operation, or perfect accuracy.
        </p>

        <h3>9. Limitation of Liability</h3>
        <p>
          To the extent permitted by law, we are not liable for indirect, incidental, consequential,
          or special damages, including loss of data, profits, or business interruption.
        </p>

        <h3>10. Termination</h3>
        <p>
          You may stop using the service at any time. We may suspend or terminate access when required
          for security, abuse prevention, legal compliance, or operational reasons.
        </p>

        <h3>11. Governing Law</h3>
        <p>
          These terms are governed by applicable laws of Indonesia, unless otherwise required by mandatory local law.
        </p>

        <h3>12. Contact</h3>
        <p>
          For terms inquiries: <a href="mailto:admin@andrasat.com">admin@andrasat.com</a>
        </p>
      </article>

      <div class="mt-10 pt-6 border-t border-gray-800 flex flex-wrap gap-3">
        <NuxtLink class="text-sm text-aero hover:underline" to="/privacy-policy">Privacy Policy</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/compliance">Compliance Notice</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/data-deletion">Data Deletion Request</NuxtLink>
      </div>
    </div>
  </PageContainer>
</template>
