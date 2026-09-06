# Craft flow

Implement the requested frontend feature through a working, verified result. Reuse the project's framework, source layout, design system, and installed icon set. Edit source files, not generated build output.

## Establish the task brief

Read the affected code and the relevant product/design context. Identify the goal, target surface, content, expected interactions, and acceptance conditions. Reuse an existing brief or the user's stated direction. For a clear request, state any material assumption and continue. Ask when a missing decision changes the scope, factual content, or approved visual direction.

Use [shape.md](shape.md) when planning will resolve a material ambiguity or the user requests a planning step. An implementation request with sufficient context does not require a separate interview or repeated confirmation. Honor any review checkpoint the user requested.

Treat an approved mock or named visual direction as a contract for composition, hierarchy, density, atmosphere, and distinctive ingredients. If the implementation needs a material departure, resolve that decision with the user. Do not rasterize UI text or replace required imagery with filler.

## Load references for the decisions at hand

| Need | Reference |
|---|---|
| Layout, spacing, grid | [layout.md](layout.md) |
| Type hierarchy or font loading | [typeset.md](typeset.md) |
| Forms or complex interaction | [interaction-design.md](interaction-design.md) |
| Motion | [animate.md](animate.md) |
| Color or themes | [colorize.md](colorize.md) |
| Responsive behavior | [adapt.md](adapt.md) |
| Labels, error messages, or other UX copy | [clarify.md](clarify.md) |
| Raster assets or useful mock exploration | [codex.md](codex.md) |

Read only what addresses the task. Image generation is a capability, not a gate: preserve an established direction and use HTML/CSS/SVG or existing assets when suitable. If a requested image workflow is unavailable, state the limitation and complete the work that can proceed.

## Implement and verify

- Preserve real content, dynamic values, working links, and the approved visual direction. Do not invent metrics, descriptions, or functional controls.
- Use semantic headings, landmarks, labels, accessible names, keyboard paths, and visible focus. Keep content usable without motion or decorative media.
- Check readable typography, meaningful spacing, image dimensions and alt text, coherent icons, and responsive wrapping. Cover the states the changed interaction actually has, such as loading, error, empty, or disabled.
- Keep motion purposeful, bounded in cost, and compatible with reduced motion. Reuse existing dependencies and local patterns.
- Run relevant project checks from AGENTS.md. Inspect the affected UI at representative widths and states with available browser/screenshot tools. Read the screenshots you capture. State any visual or runtime checks unavailable in the environment.

Compare the result against the brief and observed evidence. Fix material in-scope defects, then recheck the affected behavior. A detector is diagnostic evidence, not proof of completion. Expand validation only for a concrete remaining risk; stop when the requested feature and relevant checks are complete.

Present the result, meaningful design decisions, checks actually run, and remaining limitations or accepted deviations. Do not require an additional approval round merely to report completed work.
