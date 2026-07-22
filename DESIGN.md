---
name: andrasat.com
description: Evidence Led portfolio of Andra Satria, Senior Full Stack Developer
direction: Evidence Led
font: Commissioner
fontWeights: 400, 500, 600, 700
themes: system, light, dark
---

## 1. Contract

**Creative North Star**: Evidence Led. A calm, professional, neutral, modern portfolio that lets a recruiter or client establish credibility through a clear sequence: who Andra is, what he builds, where he has worked, and where to inspect more.

**Register**: Brand surface. Design communicates identity, credibility, and craftsmanship through information hierarchy rather than decoration.

**Layout grammar**:

- Use an asymmetric, left-anchored composition with a strong opening statement and compact proof rail.
- Put current role and links near the introduction.
- Present skills as a concise capability index, never an icon wall.
- Present projects as evidence rows. Projects contains **Now Building** only, with Yifa prominent and existing factual content unchanged.
- Present experience as readable chronology, with dates aligned as metadata.
- Keep contact visible at the end of the primary flow.
- Use rules and whitespace to separate evidence groups. Do not repeat card grids.

## 2. Themes and Color Tokens

Use OKLCH tokens exactly. Light and Dark are designed states, not inverted colors. System resolves to the operating system preference.

| Token | Light | Dark | Role |
|---|---|---|---|
| `canvas` | `oklch(0.985 0.003 235)` | `oklch(0.17 0.012 235)` | Page background |
| `surface` | `oklch(1 0 0 / 0.7)` | `oklch(0.21 0.014 235 / 0.72)` | Selected controls and restrained surfaces |
| `ink` | `oklch(0.22 0.016 235)` | `oklch(0.91 0.008 235)` | Primary text |
| `muted` | `oklch(0.43 0.018 235)` | `oklch(0.72 0.014 235)` | Supporting text and metadata |
| `rule` | `oklch(0.82 0.012 235)` | `oklch(0.32 0.018 235)` | Dividers and row rules |
| `control` | `oklch(0.62 0.018 235)` | `oklch(0.55 0.022 235)` | Control borders |
| `accent` | `oklch(0.66 0.115 220)` | `oklch(0.76 0.1 220)` | Interaction accent |
| `accent-ink` | `oklch(0.39 0.09 220)` | `oklch(0.8 0.085 220)` | Accent text on the current canvas |
| `focus` | `oklch(0.59 0.14 220)` | `oklch(0.82 0.13 220)` | Focus outline |

Rules:

- Use `accent` and `accent-ink` only for links, selected states, actions, and interaction feedback.
- Use `rule` sparingly. Borders are 1px unless a focus outline requires 3px.
- No gradients, gradient text, neon effects, decorative blur, or side-stripe accents.
- No warm paper treatment, purple or violet accent, licorice canvas, or dark-only assumptions.

## 3. Typography

Commissioner is the only font family. Load Google Fonts with `display=swap` and the Latin subset. Allowed weights are exactly 400, 500, 600, and 700.

| Role | Weight | Size | Line height |
|---|---:|---:|---:|
| Display title | 600 | `clamp(2.5rem, 7vw, 5.75rem)` | `0.98` |
| Section title | 600 | `clamp(1.75rem, 4vw, 3rem)` | `1.05` |
| Project or experience title | 600 | `1rem` | `1.35` |
| Body and reading copy | 400 | `clamp(0.9375rem, 1.4vw, 1.0625rem)` | `1.8` |
| Supporting copy | 400 | `0.875rem` | `1.75` |
| Navigation, metadata, tags | 500 or 600 | `0.75rem` to `0.8125rem` | `1.4` |
| Strong inline text | 600 | inherited | inherited |

Use `text-wrap: balance` for titles and `text-wrap: pretty` for long prose. Keep body copy left aligned, within 66ch. Use negative tracking only for display titles, approximately `-0.045em`. Do not use all caps for sentences.

## 4. Spacing and Shape

| Token | Value |
|---|---:|
| `space-1` | `0.5rem` |
| `space-2` | `1rem` |
| `space-3` | `1.5rem` |
| `space-4` | `2.5rem` |
| `space-5` | `4.5rem` |
| `radius` | `0.5rem` |
| `control-min` | `2.75rem` |

Use spacing, rules, and alignment as primary grouping tools. Avoid nested cards and arbitrary shadows. Controls must provide at least a 44 by 44 CSS pixel target.

## 5. Primitives and States

### Link

- Resting: inherited or `accent-ink` text, no forced decoration for navigation, underline for inline links, underline offset `0.25rem`.
- Hover: `accent-ink`, visible underline where applicable.
- Focus: 3px `focus` outline with 3px offset.
- Current page: `accent-ink` plus a non-color indicator such as underline.

### Action

- Resting: inline-flex, minimum 44px height and width, 1px `control` border, `radius`, `accent-ink` text, horizontal `space-2` padding.
- Hover: `accent` border and `surface` background.
- Active: subtle `transform: scale(0.97)` only for pointer activation.
- Focus: visible 3px `focus` outline.
- Disabled: retain readable contrast and communicate unavailable state without relying on color alone.

### ThemeControl

Expose System, Light, and Dark as icon-only Phosphor Desktop, Sun, and Moon buttons with accessible button names, `title`, and `aria-pressed`. Show the active choice with a filled icon plus selected border and surface, not color alone. Start in System when no saved preference exists. Persist explicit Light or Dark locally. A saved choice overrides system changes; System follows `prefers-color-scheme` and responds to later OS changes. Change themes without reload, content changes, or focus loss.

### EvidenceRow

- Resting: full-width row with 1px top or bottom `rule`, `space-3` block padding, no decorative card treatment.
- Structure: distinct title or employer column, metadata column where useful, description in readable measure, tags only when they add evidence.
- Hover: restrained `surface` or `accent-ink` response only when the row contains a real link.
- Focus: visible `focus` outline on the actual link or action.
- Wrap: long names, dates, URLs, and tags wrap without clipping or horizontal overflow.

### CapabilityIndex

Use a concise three-column index at desktop and tablet widths, with each category separated by a top `rule`. Use semantic headings and text tags, not icons or repeated cards. Collapse to one column on small screens. Tags use 1px `control` borders, `radius`, `muted` text, `0.25rem 0.5rem` padding, and 500 or 600 weight.

### Header

Use a semantic header with wordmark, navigation, and theme control. Desktop layout is a three-column grid with a minimum height of `5.25rem`. Navigation and controls have 44px minimum targets. At 375px, wrap navigation below the wordmark and keep theme control reachable. No shrink-on-scroll, logo animation, terminal prompt, or icon wall.

### Footer

Use a quiet footer with contact or social destinations and copyright. Separate it with a top `rule`; use muted text and normal links. Keep it lightweight, without sitemap columns, newsletter signup, decorative glow, or legal pages.

## 6. Responsive Rules

| Viewport | Rules |
|---|---|
| `375px` | Single-column intro, capability index, evidence rows, and experience chronology. Navigation may wrap below header identity. Verify readable title wraps, reachable controls, and no horizontal overflow. |
| `768px` | Begin two-column intro and evidence layouts where content benefits. Keep dates and metadata aligned without clipping. Capability index may use three columns when each remains readable. |
| `1280px` | Use the asymmetric Evidence Led composition, max content width around `76rem`, readable body measure, compact proof rail, and balanced whitespace. Do not create excessive empty hero space. |

Across all widths, preserve semantic order, left-aligned body copy, link destinations, and content. Long text must wrap. No heading, row, control, or theme state may overflow the viewport.

## 7. Accessibility and Motion

Target WCAG 2.1 AA. Use semantic `header`, `nav`, `main`, `section`, `article`, and `footer` landmarks where appropriate. Keep one clear `h1` per primary page, ordered headings, descriptive link names, keyboard operation, and visible focus in every theme. Maintain 4.5:1 normal text contrast, 3:1 large text and required non-text boundaries, and meaningful alternative text for meaningful images.

Motion is limited to state change, spatial orientation, or interaction feedback. Use opacity and transform, with short ease-out transitions. Content is visible without animation. Under `prefers-reduced-motion: reduce`, remove movement and preserve immediate content visibility.

## 8. Explicit Exclusions and Accepted Constraints

Exclude terminal styling, typewriter effects, Konami interactions, monospace typography, icon walls, logo walls, **Selected Works**, mockup classes, mockup routes, gradient text, Red Hat, Merriweather, licorice, dark-only behavior, decorative glassmorphism, and legal pages.

This contract does not invent content, metrics, outcomes, project descriptions, employers, dates, or availability claims. Projects contains **Now Building** only. Legal cleanup, route removal, and migration work are outside this document's implementation scope.

Accepted constraints: Commissioner is the sole typeface; the interface uses neutral canvas tokens and a restrained aero interaction accent; System, Light, and Dark must remain usable and readable; evidence rows and whitespace replace repeated card grids; responsive behavior must satisfy 375px, 768px, and 1280px targets.
