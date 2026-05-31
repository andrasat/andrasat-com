<script setup lang="ts">
useSeoMeta({
  title: 'Data Deletion Request - Yifa',
  description: 'How to request deletion of account-linked data for Yifa.'
})
</script>

<template>
  <PageContainer>
    <div class="max-w-4xl mx-auto animate-fade-in">
      <div class="mb-8">
        <h2 class="text-3xl md:text-4xl font-mono font-bold text-white tracking-tight mb-3">
          Data Deletion <span class="text-aero">Request</span>
        </h2>
        <p class="text-gray-400 max-w-2xl">
          Request deletion of account-linked synced data associated with your Yifa usage.
          If you used local on-device storage only and did not enable sync or account-linked features,
          we may not have a remote copy of your financial records to delete.
        </p>
      </div>

      <article class="prose prose-invert max-w-none prose-p:text-gray-300 prose-li:text-gray-300 prose-headings:text-white prose-a:text-aero">
        <h3>How to Request Deletion</h3>
        <ol>
          <li>
            Send an email to
            <a href="mailto:admin@andrasat.com">admin@andrasat.com</a>
            with subject: <strong>"Yifa Data Deletion Request"</strong>.
          </li>
          <li>Include the account identifier (for example, your login email) used in Yifa.</li>
          <li>State whether you want full account deletion or only specific synced records removed.</li>
        </ol>

        <h3>Verification</h3>
        <p>
          To protect account security, we may ask for additional verification before processing deletion.
        </p>

        <h3>Processing Time</h3>
        <p>
          We aim to process valid requests within 30 days, unless longer handling is required by
          technical constraints or legal obligations.
        </p>

        <h3>What May Be Retained</h3>
        <ul>
          <li>Records required by law or dispute resolution obligations.</li>
          <li>Minimal security logs needed to prevent abuse and protect service integrity.</li>
          <li>Backup data that is overwritten according to infrastructure retention cycles.</li>
        </ul>

        <h3>Local Device Data</h3>
        <p>
          If your data was stored only on your device and sync was not enabled, that data is generally not
          stored by us remotely. In those cases, you can usually remove it by uninstalling the app or clearing
          app storage. Device-level behavior may vary by platform and OS settings.
        </p>
      </article>

      <div class="mt-10 pt-6 border-t border-gray-800 flex flex-wrap gap-3">
        <NuxtLink class="text-sm text-aero hover:underline" to="/privacy-policy">Privacy Policy</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/terms-of-service">Terms of Service</NuxtLink>
        <NuxtLink class="text-sm text-aero hover:underline" to="/compliance">Compliance Notice</NuxtLink>
      </div>
    </div>
  </PageContainer>
</template>
