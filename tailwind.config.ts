import type { Config } from 'tailwindcss'
import typography from '@tailwindcss/typography'

export default <Partial<Config>>{
  theme: {
    fontFamily: {
      sans: ['Commissioner', 'sans-serif']
    },
    extend: {
      colors: {
        canvas: 'var(--color-canvas)',
        surface: 'var(--color-surface)',
        ink: 'var(--color-ink)',
        muted: 'var(--color-muted)',
        rule: 'var(--color-rule)',
        control: 'var(--color-control)',
        accent: 'var(--color-accent)',
        'accent-ink': 'var(--color-accent-ink)',
        focus: 'var(--color-focus)'
      }
    }
  },
  plugins: [typography]
}
