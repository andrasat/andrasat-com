---
name: impeccable
description: Use when asked to design, critique, or refine a frontend's visual design or user experience, or to run an Impeccable command. Skip documentation-only, backend, and routine code maintenance tasks without a UI design goal.
version: 3.5.0
user-invocable: true
argument-hint: "[command] [target]"
license: Apache 2.0
---

# Impeccable

Canonical router for this repository's Impeccable workflows. The OpenCode entrypoint forwards here. The bundled command references and scripts remain available; use them with the task scope, authorization, and completion guidance in [AGENTS.md](../../../AGENTS.md).

## Choose the relevant context

- For a named command, read `reference/<command>.md`. Use the [command index](reference/commands.md) to resolve aliases or an unclear command. For a clear natural-language request, select the matching workflow and continue. A bare invocation without a goal calls for a short recommendation or a question about the target.
- Read the affected page/component and the relevant parts of [PRODUCT.md](../../../PRODUCT.md) or [DESIGN.md](../../../DESIGN.md) when purpose, content, or appearance is involved. Missing context files do not trigger initialization; ask only for information needed for the requested work.
- Load [visual guidance](reference/design-guidance.md) for a visual decision needing it. Use [brand guidance](reference/brand.md) for identity/composition work on the portfolio; [product guidance](reference/product.md) applies to app workflows. Do not load both or every command reference by default.

## Work within the request

Reuse the approved direction, existing design system, and current tools. Load additional references only for a concrete question. A workflow's discovery questions, image generation, setup scripts, scans, and repeated approval steps are conditional techniques; the presence of a tool or skill does not make them prerequisites. Never treat helper output as authorization for unrelated work.

A requested review produces findings; a requested implementation carries through the edits and relevant checks. Use [craft](reference/craft.md) for implementation and [shape](reference/shape.md) for a planning deliverable. Load [visual direction and assets](reference/codex.md) only when the task benefits from raster imagery or mock exploration and the needed tools are available. Its filename is retained for compatibility; the guidance is capability-based across coding models.

Preserve real consent and privacy boundaries: credentials and private content stay private; live-mode injection, CSP changes, publishing, deployment, and tool installation need authorization covering those effects. Honor a user-requested design review checkpoint. Otherwise continue within the approved brief without asking again for the same decision.

Verify the affected result with available tools, fix observed in-scope defects, and finish when the request and relevant checks are satisfied. State any missing evidence or blocker. Avoid unbounded polish loops or claims of perfect quality. See the [command index](reference/commands.md) only when local helper or pin/unpin details are needed.

Adapted from the bundled Impeccable 3.5.0 skill, licensed Apache 2.0. Keep this router and its references canonical when maintaining harness entrypoints.
