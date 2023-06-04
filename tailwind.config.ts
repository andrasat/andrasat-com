import type { Config } from 'tailwindcss'

export default <Partial<Config>>{
  theme: {
    fontFamily: {
      sans: ['Comfortaa', 'sans-serif'],
      mono: ['Red Hat Mono', 'monospace']
    },
    extend: {
      colors: {
        aero: '#51b4d3',
        licorice: '#0e0311',
        'medium-slate-blue': '#7d66dd',
        coral: '#f98c67',
        'indigo-dye': '#1c4666'
      }
    }
  }
}
