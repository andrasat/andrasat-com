import type { Config } from 'tailwindcss'

export default <Partial<Config>>{
  theme: {
    fontFamily: {
      sans: ['Urbanist', 'sans-serif'],
      mono: ['Red Hat Mono', 'monospace']
    },
    extend: {
      colors: {
        aero: '#51b4d3',
        licorice: '#0e0311',
        'medium-slate-blue': '#7d66dd',
        coral: '#f98c67',
        'indigo-dye': '#1c4666'
      },
      keyframes: {
        'fade-in': {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' }
        }
      },
      animation: {
        'fade-in': 'fade-in 0.5s ease-in-out'
      }
    }
  }
}
