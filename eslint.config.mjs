import withNuxt from './.nuxt/eslint.config.mjs'

export default withNuxt({
  "root": true,
  "parser": "@babel/eslint-parser",
  "parserOptions": {
    "sourceType": "module",
    "ecmaVersion": "latest"
  },
  "rules": {
    "vue/no-multiple-template-root": "off",
    "arrow-parens": "off"
  }
})
