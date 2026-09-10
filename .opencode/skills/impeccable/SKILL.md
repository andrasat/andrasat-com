---
name: impeccable
description: Use when asked to design, critique, or refine a frontend's visual design or user experience, or to run an Impeccable command. Skip documentation-only, backend, and routine code maintenance tasks without a UI design goal.
version: 3.5.0
user-invocable: true
argument-hint: "[command] [target]"
license: Apache 2.0
allowed-tools:
  - Bash(npx impeccable *)
---

# Impeccable for OpenCode

Read the [canonical Impeccable router](../../../.github/skills/impeccable/SKILL.md), passing through the user's command and target. Follow its task-specific reference links; relative links in that router are resolved from `.github/skills/impeccable/`.

This entrypoint preserves OpenCode discovery and tool metadata. Use only the tools and permissions available in the current harness. The canonical guide applies across coding models, and no setup script or image tool is required merely to invoke it.

The existing local reference and script copies remain for compatibility. Maintain shared instructions in the canonical router and references. Bundled Impeccable 3.5.0, Apache 2.0.
