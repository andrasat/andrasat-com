# Shape a design brief

Use this workflow to plan a frontend feature or resolve an unclear direction. A standalone `shape` request produces a brief; it does not authorize application implementation. When called as part of an authorized `craft` task, return the brief to that task and continue once the material decisions are sufficiently clear.

## Resolve the important questions

Start with the user's request, existing decisions, the affected surface, and relevant PRODUCT.md / DESIGN.md sections. Ask only for missing information that changes the plan. A clear brief needs no interview; a sparse or conflicting brief may need a focused question, then another only if the answer leaves a material gap.

Useful topics, when unresolved:

- **Purpose and user:** the problem, user's context, primary action, and observable success.
- **Content and data:** source of real content, dynamic values, realistic ranges, and relevant empty/error states. Do not invent business facts.
- **Scope:** target screen or flow, fidelity, interactivity, and technical constraints. Use scope already supplied rather than asking again.
- **Direction:** hierarchy, density, typography, theme, and visual references. Preserve existing brand choices unless a redesign is requested.
- **Assets and behavior:** required media, likely sources, interaction states, responsive behavior, accessibility, performance, and reduced-motion needs.
- **Tradeoffs:** the main alternative, explicit exclusions, and the consequence of choosing the wrong direction.

Separate observed facts, accepted decisions, assumptions, and unanswered questions. Make routine design choices within the request; do not manufacture decisions for the user to approve.

## Visual exploration when useful

Use visual probes when the user requests alternatives or a substantial unresolved visual choice benefits from comparison. If image generation is available and appropriate, [codex.md](codex.md) describes mock and asset handling. Its availability does not make probes mandatory. Existing approved direction, minor refinements, or a code-native solution may need no generated imagery.

Keep exploration bounded to the decision in question. Vary structure or hierarchy deliberately, not just palette. A mock informs direction; it does not replace content, interaction, or accessibility requirements. Reuse the user's selected direction or delegated choice without repeated palette and mock approvals.

## Deliver the brief

For a focused task, use a few concrete bullets. For a larger flow, include only the sections that help implementation:

1. Goal, audience, and primary user action.
2. Scope and acceptance conditions, including applicable states and responsive behavior.
3. Direction and layout: hierarchy, composition, typography, theme, and any approved reference.
4. Content and assets: real sources, dynamic data, media roles, and unresolved factual inputs.
5. Interaction model, relevant constraints, and significant tradeoffs.
6. Remaining questions and the specific references needed for implementation.

Link to existing decisions instead of restating long project documents. Mark proposed choices as proposals when approval is still needed. Honor any requested design review checkpoint; otherwise the planning deliverable is complete when it is usable and its unresolved dependencies are explicit.
