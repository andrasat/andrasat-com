# Initialize project context

Use `init` when the user requests creating or refreshing project design context. It is not an automatic prerequisite for an unrelated design edit. Reuse the current request and repository evidence; a missing PRODUCT.md or DESIGN.md alone does not justify a setup detour.

## Inspect the relevant existing context

Look for PRODUCT.md and DESIGN.md at the root, then `.agents/context/` or `docs/` when needed. Read existing documents before editing. Inspect the configuration, representative source, tokens, and assets that establish the requested facts. A targeted refresh does not require crawling the entire repository.

Preserve existing decisions and edit only the requested documents or sections. If the request leaves an important choice unclear, ask about that choice. Do not require confirmation of facts already documented or reapprove an authorized refresh.

## Capture product intent

PRODUCT.md records:

- Register: `brand` for identity/content surfaces, `product` for app workflows. Use a bare value under `## Register` for helper-script compatibility.
- Users, their context, the product purpose, and desired outcome.
- Personality, relevant reference points, and anti-references.
- A few strategic design principles and accessibility requirements.

Use confirmed facts from the brief and repository. With a sparse request, ask for missing strategic inputs before treating them as facts. Keep visual tokens and component specifications in DESIGN.md. Do not invent user research, brand claims, or business outcomes.

## Capture the visual system when requested

Use [document.md](document.md) to create or refresh DESIGN.md from existing tokens, styles, and components. If there is no implementation yet, clearly distinguish proposed direction from observed conventions. Preserve the project's established format; creating product context does not automatically authorize a redesign or a second document.

## Live setup is a separate scope

Configure live mode only when the user requests it or authorization already covers those effects. Use [live.md](live.md) for the current config schema, framework-specific insertion points, and lifecycle. Preserve an existing `.impeccable/live/config.json` unless its change is in scope.

Live injection and CSP source changes are distinct from documenting the project. Before a CSP patch, use the consent flow in live.md and explain the concrete source change. Honor a decline. Do not mark a patch as applied when it was declined, deferred, or unsupported. Keep injection local to the authorized development workflow, preserve privacy, and do not publish it with production output.

## Completion

Check changed context against its cited source and mark material uncertainties. Summarize the documents updated and any missing input that prevents completion. If init was explicitly included in a larger authorized task, resume that task; do not start unrelated setup, scans, updates, or recommendation loops.
