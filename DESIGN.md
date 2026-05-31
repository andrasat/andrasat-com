---
name: andrasat.com
description: Personal portfolio of Andra Satria, Senior Full Stack Developer
colors:
  primary: "#51b4d3"
  secondary: "#7d66dd"
  accent: "#f98c67"
  neutral-bg: "#0e0311"
  neutral-surface: "rgba(31,41,55,0.4)"
  neutral-border: "#374151"
typography:
  display:
    fontFamily: "Red Hat Mono, monospace"
    fontWeight: 600
  body:
    fontFamily: "Red Hat Display, Arial, sans-serif"
    fontWeight: 500
  body-bold:
    fontFamily: "Red Hat Display, Arial, sans-serif"
    fontWeight: 700
rounded:
  sm: "0.5rem"
  md: "0.75rem"
  lg: "1rem"
  full: "9999px"
spacing:
  xs: "0.25rem"
  sm: "0.5rem"
  md: "1rem"
  lg: "1.5rem"
  xl: "2rem"
  "2xl": "3rem"
components:
  text-link:
    textColor: "{colors.primary}"
    textDecoration: "underline"
    textUnderlineOffset: "4px"
    hoverTextColor: "#ffffff"
    transition: "colors 200ms"
  skill-card:
    backgroundColor: "rgba(31,41,55,0.4)"
    borderColor: "rgba(55,65,81,0.5)"
    borderRadius: "{rounded.lg}"
    hoverBorderColor: "rgba(81,180,211,0.5)"
    padding: "{spacing.lg}"
  menu-button:
    backgroundColor: "rgba(31,41,55,0.5)"
    borderColor: "{colors.neutral-border}"
    borderRadius: "{rounded.full}"
    padding: "0.5rem 0.75rem"
  footer-social-button:
    backgroundColor: "rgba(31,41,55,0.5)"
    borderColor: "{colors.neutral-border}"
    borderRadius: "{rounded.sm}"
    hoverBackgroundColor: "rgba(81,180,211,0.2)"
    hoverBorderColor: "{colors.primary}"
---

## Overview

**Creative North Star**: *The Developer Terminal, charged with personality.* A portfolio that speaks the language of code — monospace signifiers, terminal prompts, a singular electric accent against deep licorice black — but with an edge that's unmistakably human. Intentional in every detail, electric in its presence, and warm through craft rather than softness.

**Register**: Brand surface (primary). This is a personal portfolio and blog where design IS the product — it communicates identity, credibility, and craftsmanship. The Yifa legal pages are a secondary product surface where design serves compliance and trust.

**Brand personality**: Intentional, electric, human.
- **Intentional**: Every element earns its place. No filler, no buzzwords, no decoration for its own sake.
- **Electric**: The aero accent against licorice creates tension. The interface feels alive, not static. Code-like signifiers inject energy without gimmickry.
- **Human**: Warmth through craft, not softness. Easter eggs, conversational copy, a typewriter intro — these reveal the person behind the code.

**Design principles**:
- Code as aesthetic, not gimmick. Monospace appears as structural signifiers (`// andrasat`, `contact.init()`) not as decoration.
- One accent carries the interface. Aero (#51b4d3) is the electric thread; everything else is neutral.
- Motion serves clarity. Fade-ins introduce content. Hover states confirm interactivity. Nothing moves without purpose.
- Dark is the default, not a mode. No light-mode toggle. The palette is designed from dark out.
- Craft communicates credibility. The quality of the interface IS the proof. A senior developer's site should feel senior — never generic, never template-like.

**Anti-references**: Generic SaaS landing pages. Gradient-heavy hero sections. Purple-on-dark AI aesthetics. Glassmorphism for its own sake. "Modern and clean" as verbal filler. Developer portfolios that are just technology lists with no narrative. Template-like card grids. Anything that could be mistaken for a Vercel template.

**Uniqueness mandate**: The site is the reference, but it reads as too safe. Future design work should push past "clean portfolio" into something that feels unmistakably personal. The developer-terminal concept is solid but under-explored — lean harder into the metaphor without crossing into gimmickry. The Konami easter egg is the right instinct; find more moments like it that reward attention.

## Colors

**The Aero Carries Meaning Rule**: One accent (#51b4d3) for links, interactive elements, and code signifiers. Never use aero for non-interactive decoration. Never introduce a second accent blue.

**The Coral Is Emphasis Rule**: Coral (#f98c67) is reserved for semantic emphasis — job titles, key numbers, highlight spans. It appears sparingly, never as a background or button fill.

**The Licorice Is Canvas Rule**: Licorice (#0e0311) is the background, not a surface. Surfaces (cards, menus) use gray-800 at varying opacity over licorice. Never use a flat mid-gray background.

**Palette**:

| Token | Value | Role |
|---|---|---|
| `licorice` | `#0e0311` | Primary background |
| `aero` | `#51b4d3` | Primary accent, links, interactive |
| `medium-slate-blue` | `#7d66dd` | Secondary accent, available for variety |
| `coral` | `#f98c67` | Emphasis, highlights, semantic accent |
| `indigo-dye` | `#1c4666` | Dark tonal variant |

**Neutral scale** (Tailwind gray):
- `gray-300` (#d1d5db): Primary body text
- `gray-400` (#9ca3af): Secondary text
- `gray-500` (#6b7280): Muted text
- `gray-600` (#4b5563): Faint text
- `gray-700` (#374151): Default border
- `gray-800` (#1f2937): Surface fills (at opacity)

**Text on background rule**: Body text is gray-300 on licorice. White (#ffffff) reserved for headings and hover states. Never use pure white for body copy. Never use gray text below gray-400 for readable content.

## Typography

**The Monospace Is Structural Rule**: Red Hat Mono (weight 600) is used ONLY for headings, code-like signifiers, labels, and navigation elements. It communicates structure — never use it for body copy or paragraphs.

**The Sans Is Prose Rule**: Red Hat Display (weights 500, 700) carries all body text, descriptions, and extended reading. Weight 700 for bold emphasis within prose.

**Hierarchy**:

| Role | Font | Weight | Size | Usage |
|---|---|---|---|---|
| Display | Red Hat Mono | 600 | 3xl–5xl | Page titles, name |
| Heading | Red Hat Mono | 600 | xl–2xl | Section headers, card titles |
| Label | Red Hat Mono | 600 | sm | Category labels, nav, footer |
| Body | Red Hat Display | 500 | base–lg | Prose, descriptions |
| Body Bold | Red Hat Display | 700 | base–lg | Emphasized body text |

**Typography rules**:
- Tracking: tight for display (`tracking-tighter`), wide for labels (`tracking-widest`)
- Line height: relaxed for body (`leading-relaxed`), normal for headings
- Never use more than two font families on a single view
- Never center-align paragraphs longer than two lines

## Elevation

**The Flat-By-Default Rule**: The interface sits on licorice without elevation. Shadows, blurs, and borders appear ONLY as responses to state: scroll, hover, focus, or as container edges.

**Elevation vocabulary**:

| Name | Value | Trigger |
|---|---|---|
| `ambient-sm` | `backdrop-blur-sm` | Footer surface, persistent containers |
| `ambient-md` | `backdrop-blur-md` + `shadow-lg` | Header on scroll |
| `ambient-xl` | `backdrop-blur-xl` + `shadow-2xl` | Popover menu |
| `surface-card` | `bg-gray-800/40` + `border-gray-700/50` | Card resting state |
| `surface-card-hover` | `bg-gray-800/60` + `border-aero/50` | Card hover state |

**Border rules**:
- Default borders: `border-gray-700` or `border-gray-800`
- Interactive hover borders transition to `border-aero/50`
- Never use borders thicker than 1px on cards
- Never use glowing/neon border effects

## Components

### TextLink
Inline text links. Aero-colored with underline offset. Transitions to white on hover.
- **Resting**: `text-aero`, `underline`, `decoration-aero/30`, `underline-offset-4`
- **Hover**: `text-white`, `decoration-white`, 200ms color transition
- **Never**: Gradient text, animated underlines, oversized underlines

### SkillCard
Grid cards for skill categories. Dark surface with subtle border, aero border on hover.
- **Resting**: `rounded-2xl`, `bg-gray-800/40`, `border-gray-700/50`, `p-6`
- **Hover**: `border-aero/50`, `bg-gray-800/60`, 300ms transition
- **Label**: Monospace, uppercase, `tracking-widest`, gray-400, transitions to aero on hover
- **Never**: Inner shadows, gradient borders, side-stripe accents

### MenuButton
Hamburger menu trigger. Pill-shaped, three-line icon with aero accents.
- **Shape**: `rounded-full`, `h-10`, `px-3`
- **Resting**: `bg-gray-800/50`, `border-gray-700`
- **Hover**: `bg-gray-700/50`, top and bottom lines shorten
- **Active**: `scale-95`
- **Icon lines**: `bg-aero`, 2px height, 3 lines stacked
- **Never**: Animated to X, rotating icon, border-radius < full

### PopoverMenu
Dropdown navigation menu. Glass overlay with blur.
- **Container**: `backdrop-blur-xl`, `bg-licorice/90`, `border-gray-700`, `rounded-xl`, `shadow-2xl`, `ring-1 ring-white/10`
- **Items**: `rounded-lg`, `hover:bg-white/10`, icon in aero, text in font-medium
- **Entry animation**: Fade in + translateY(-10px → 0), 200ms ease-out
- **Backdrop**: Transparent (does not dim the page)
- **Never**: Slide-from-side, scale origin animation, backdrop dimming

### Header
Fixed top bar. Transparent by default, frosted glass on scroll.
- **Resting**: Transparent background, no border
- **Scrolled**: `bg-licorice/70`, `backdrop-blur-md`, `border-b border-gray-800`, `shadow-lg`
- **Transition**: 300ms on all properties
- **Height**: `h-20` (5rem)
- **Never**: Shrink-on-scroll, color-shift on scroll, logo animation

### Footer
Bottom section with contact info and social links. Frosted surface with top border.
- **Container**: `border-t border-gray-800`, `bg-licorice/50`, `backdrop-blur-sm`
- **Social buttons**: `rounded-xl`, `bg-gray-800/50`, `border-gray-700`, hover: `bg-aero/20` + `border-aero`, 300ms transition
- **Decorative**: Subtle blurred glow (`bg-aero/5`, `blur-3xl`) in corner — the only decorative element allowed
- **Never**: Heavy footer with columns, sitemap, newsletter signup

## Do's and Don'ts

### Do
- **Use aero as the singular interactive accent.** Links, icons, hover states — aero and only aero.
- **Use monospace for structural elements.** Headings, labels, code-like signifiers communicate the developer identity.
- **Let surfaces sit on licorice.** Cards and containers get gray-800 fills at opacity, never solid mid-gray.
- **Animate with purpose.** Fade-in for content entry, 200–300ms transitions for hover, scale-95 for button press.
- **Keep borders subtle.** gray-700 or gray-800, transitioning to aero/50 on hover. Never thicker than 1px.
- **Use backdrop-blur for elevation.** Frosted glass communicates depth on the dark background without heavy shadows.
- **Find moments of personality.** Easter eggs, playful copy, deliberate asymmetry — things that reward attention and feel unmistakably human. The Konami easter egg is the right instinct.
- **Push past "clean portfolio."** If a design choice could appear on any developer's site, find a more specific alternative. The terminal metaphor, the aero accent, and craft-level detail are the differentiators.
- **Meet WCAG 2.1 AA.** Contrast ratios, keyboard navigation, screen reader support, and reduced-motion alternatives are not optional.

### Don't
- **Don't use gradient text.** No `bg-gradient-to-r bg-clip-text text-transparent` anywhere.
- **Don't use purple/violet as a primary accent.** The AI palette (purple gradients, violet glows) is explicitly anti-referenced.
- **Don't use side-stripe or left-border accents on cards.** No `border-l-4 border-aero` card treatments.
- **Don't add a light mode.** The palette is dark by design. A toggle would split the identity.
- **Don't center-align paragraphs.** Headings and short labels can be centered; body copy is always left-aligned or justified in narrow contexts.
- **Don't introduce a third font family.** Red Hat Display and Red Hat Mono are the only fonts. No decorative or script fonts.
- **Don't use glassmorphism as decoration.** Backdrop-blur exists to communicate elevation, never as ornamental frosting.
- **Don't use bouncing, elastic, or spring animations.** All motion uses standard ease curves. No `cubic-bezier` bounce overshoots.
