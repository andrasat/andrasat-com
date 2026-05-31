<script setup lang="ts">
useSeoMeta({
  title: 'Privacy Policy - Yifa',
  description: 'Privacy Policy for Yifa by Andra Satria.'
})

const effectiveDate = 'May 31, 2026'
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto animate-fade-in">
      <div class="mb-8">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-3">
          Privacy <span class="text-aero">Policy</span>
        </h2>
        <p class="text-sm text-gray-400">
          Effective Date: {{ effectiveDate }}
        </p>
      </div>

      <article class="prose prose-invert max-w-none prose-p:text-gray-300 prose-li:text-gray-300 prose-headings:text-white prose-a:text-aero">
        <p>
          This Privacy Policy explains how Yifa and related services operated by Andra Satria
          (<strong>"we"</strong>, <strong>"us"</strong>, <strong>"our"</strong>) collect,
          use, store, and protect information when you use our app or website.
        </p>

        <h3>1. Service Scope</h3>
        <p>
          Yifa is a personal finance tracking and insights tool. Yifa is not a bank, lender,
          broker, payment processor, investment platform, or tax advisory service.
        </p>

        <h3>2. Information We Collect</h3>
        <ul>
          <li><strong>Information you provide:</strong> account data, transaction entries, categories, goals, and support messages.</li>
          <li><strong>Technical data:</strong> device/app diagnostics and usage signals needed for reliability and security.</li>
          <li><strong>Service provider data:</strong> limited data may be processed by providers supporting optional account sign-in, cloud sync, infrastructure hosting, and internet-dependent AI features.</li>
        </ul>

        <h3>3. How We Use Information</h3>
        <ul>
          <li>Provide and maintain app features.</li>
          <li>Enable optional cloud sync and account restore flows.</li>
          <li>Generate categorizations, summaries, and insight features.</li>
          <li>Improve app stability, performance, and security.</li>
          <li>Respond to support requests and legal obligations.</li>
        </ul>

        <h3>4. Local Storage and Optional Sync</h3>
        <p>
          Core transaction data is stored on your device by default. If you enable cloud sync,
          relevant data is stored on remote infrastructure to support backup and multi-device access.
        </p>
        <p>
          We do not collect bank account login credentials, and Yifa does not connect to bank accounts
          for credential-based syncing.
        </p>

        <h3>5. AI and Network-Dependent Features</h3>
        <p>
          Some features (such as AI-assisted categorization and summaries) require internet access
          and third-party services. Outputs are automated and may be incomplete or inaccurate.
          Always review critical information before making financial decisions.
        </p>

        <h3>6. Data Sharing</h3>
        <p>
          We do not sell personal information. Data is shared only as needed to operate features you use,
          such as optional sign-in, optional cloud sync, infrastructure hosting, and internet-dependent AI
          features, or when required for legal and security reasons.
        </p>

        <h3>7. Data Retention</h3>
        <p>
          We retain data as needed to operate services, resolve disputes, enforce terms, and meet legal requirements.
          Retention varies depending on whether data is local-only, synced, or present in backups.
        </p>

        <h3>8. Your Choices</h3>
        <ul>
          <li>Disable optional sync/online features where available.</li>
          <li>Request account-linked data deletion (see <NuxtLink to="/data-deletion">Data Deletion Request</NuxtLink>).</li>
          <li>Remove local data by uninstalling the app or clearing app storage (device-level behavior may vary).</li>
        </ul>

        <h3>9. Security</h3>
        <p>
          We use reasonable technical and organizational safeguards. No system can guarantee absolute security.
        </p>

        <h3>10. Changes to This Policy</h3>
        <p>
          We may update this policy from time to time. Updates will be posted on this page with a revised effective date.
        </p>

        <h3>11. Contact</h3>
        <p>
          For privacy requests or questions: <a href="mailto:admin@andrasat.com">admin@andrasat.com</a>
        </p>
      </article>

      <div class="mt-10 pt-6 border-t border-gray-800 flex flex-wrap gap-3">
        <NuxtLink class="text-sm text-aero hover:underline" to="/terms-of-service">Terms of Service</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/compliance">Compliance Notice</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/data-deletion">Data Deletion Request</NuxtLink>
      </div>
    </div>
  </PageContainer>
</template>
