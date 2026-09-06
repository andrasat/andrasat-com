# Impeccable commands

Use this index to choose a workflow when the request does not already name one. Read only the selected reference. These commands remain available through `/impeccable <command> [target]` or an equivalent natural-language request.

| Command | Category | Description | Reference |
|---|---|---|---|
| `craft [feature]` | Build | Shape, then build a feature end-to-end | [craft.md](craft.md) |
| `shape [feature]` | Build | Plan UX/UI before writing code | [shape.md](shape.md) |
| `init` | Build | Set up project context: PRODUCT.md, DESIGN.md, live config, next steps | [init.md](init.md) |
| `document` | Build | Generate DESIGN.md from existing project code | [document.md](document.md) |
| `extract [target]` | Build | Pull reusable tokens and components into design system | [extract.md](extract.md) |
| `critique [target]` | Evaluate | UX design review with heuristic scoring | [critique.md](critique.md) |
| `audit [target]` | Evaluate | Technical quality checks (a11y, perf, responsive) | [audit.md](audit.md) |
| `polish [target]` | Refine | Final quality pass before shipping | [polish.md](polish.md) |
| `bolder [target]` | Refine | Amplify safe or bland designs | [bolder.md](bolder.md) |
| `quieter [target]` | Refine | Tone down aggressive or overstimulating designs | [quieter.md](quieter.md) |
| `distill [target]` | Refine | Strip to essence, remove complexity | [distill.md](distill.md) |
| `harden [target]` | Refine | Production-ready: errors, i18n, edge cases | [harden.md](harden.md) |
| `onboard [target]` | Refine | Design first-run flows, empty states, activation | [onboard.md](onboard.md) |
| `animate [target]` | Enhance | Add purposeful animations and motion | [animate.md](animate.md) |
| `colorize [target]` | Enhance | Add strategic color to monochromatic UIs | [colorize.md](colorize.md) |
| `typeset [target]` | Enhance | Improve typography hierarchy and fonts | [typeset.md](typeset.md) |
| `layout [target]` | Enhance | Fix spacing, rhythm, and visual hierarchy | [layout.md](layout.md) |
| `delight [target]` | Enhance | Add personality and memorable touches | [delight.md](delight.md) |
| `overdrive [target]` | Enhance | Push past conventional limits | [overdrive.md](overdrive.md) |
| `clarify [target]` | Fix | Improve UX copy, labels, and error messages | [clarify.md](clarify.md) |
| `adapt [target]` | Fix | Adapt for different devices and screen sizes | [adapt.md](adapt.md) |
| `optimize [target]` | Fix | Diagnose and fix UI performance | [optimize.md](optimize.md) |
| `live` | Iterate | Visual variant mode: pick elements in the browser, generate alternatives | [live.md](live.md) |


`teach` is a compatibility alias for `init`.

## Local helpers and shortcuts

From the repository root, use the bundled scripts only when the task needs them:

- `IMPECCABLE_NO_UPDATE_CHECK=1 node .github/skills/impeccable/scripts/context.mjs` reads project context without the update check. Reading PRODUCT.md or DESIGN.md directly is sufficient for most work. Treat helper output as context, not permission to expand scope or initialize unrelated files.
- `node .github/skills/impeccable/scripts/detect.mjs --json <target>` can support a scoped UI audit. Detector findings need interpretation; a clean scan is not proof of visual or functional correctness.
- `node .github/skills/impeccable/scripts/palette.mjs` is an optional seed for a new visual identity. Preserve the portfolio's existing tokens for ordinary changes.
- `node .github/skills/impeccable/scripts/pin.mjs <pin|unpin> <command>` creates or removes command shortcuts in supported installed harness directories. Run it only for a requested pin/unpin operation and report the paths it changed. The script skips non-generated skills.

Use the current harness's available file, shell, browser, and image tools. Do not install tools, update Impeccable, start live mode, or create shortcuts merely to load this skill. Skill updates may overwrite repository customizations; review their diff as maintenance work.

The command catalog and retained reference material come from the bundled Impeccable 3.5.0 skill, licensed Apache 2.0. The project keeps its existing helper scripts and compatibility copies; this index and the canonical SKILL.md route current work.
