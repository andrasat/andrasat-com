import withNuxt from './.nuxt/eslint.config.mjs'

export default withNuxt({
  ignores: ['.github/skills/**', '.opencode/skills/**', 'nuxt.config.ts'],
}, {
  rules: {
    'vue/no-multiple-template-root': 'off',
    'arrow-parens': 'off'
  }
})
