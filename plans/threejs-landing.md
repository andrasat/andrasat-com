# ADR: Three.js landing page

**Status:** Decided

## Decision

Use a daylight **digital workstation** as the landing-page hero: a calm, low-poly monitor and keyboard that makes the portfolio's destinations immediately legible.

It serves two equal goals: rapid hiring credibility and a distinctive personal brand. The desired impression is equal parts **serious systems** and **exceptional craft**. The existing evidence-led page remains the primary information architecture.

- The canvas owns the first viewport, not the only interface.
- Name, role, current company, and navigation remain visible semantic HTML.
- Hovering a scene object reveals its label; clicking takes the visitor to the matching existing route.
- The scene assembles once on entry, then only has restrained ambient motion.
- Mobile, reduced-motion, failed-WebGL, and slow-device paths show the normal HTML page with a static hero image or CSS artwork.

## Scene

A fixed, three-quarter camera frames one assembled workstation:

1. **Monitor** — a quiet screen with rendered `Projects` and `Experience` controls; each maps to its existing route.
2. **Keyboard** — simplified keys that signal the craft of making software without becoming a literal desk scene.
3. **Signal lines** — minimal connector paths that keep the composition physical, not decorative.

The palette is light, neutral, and material: off-white canvas, graphite matte forms, and only a few translucent aero-blue signal elements. Forms are abstract product components—no literal desk or personal object—and clean and physical rather than glossy, neon, or futuristic.

## Interaction and motion

- The apparatus assembles in under a second, then settles.
- Pointer input is limited to the rendered monitor controls; the camera is not draggable.
- Clicking a rendered monitor control follows its existing route; keyboard-visible DOM links provide the same destinations.
- The hero ends after one viewport; the existing page content follows normally.

## Reference interpretation

- **Cipher:** retain the confident full-viewport composition, not its canvas-only, loader-led navigation model.
- **biip:** retain the authored maker sensibility and object focus.
- **PX PUSH:** retain direct, editorial hierarchy and high-information clarity.

## Non-goals

No free camera, scroll-jacking, tech-logo orbit, particle field, long loading sequence, or hidden content.

## Constraints to settle before implementation

- Desktop-only scene chunk budget: 200 kB gzip. The initial build is 189.46 kB gzip and uses no scene assets.
- `DESIGN.md` records the home-hero exception and static paths.

## Glossary

- **Canvas:** the Three.js-rendered visual layer.
- **DOM layer:** accessible HTML copy, navigation, and links above or beside the canvas.
- **Workstation:** the single 3D composition; it represents making software, not a literal desk.
- **Monitor controls:** rendered screen regions associated with existing destinations; visible HTML links provide their keyboard equivalent.
- **Static fallback:** the non-WebGL/reduced-motion version that preserves all content and navigation.
