---
name: grill-with-docs
description: Use when explicitly asked to stress-test a plan or design through questions and capture the resulting decisions and domain terms in documentation.
disable-model-invocation: true
---

# Grill with Docs

Adapted from `mattpocock/skills` (source recorded in the root skills-lock.json). This repository-local workflow is self-contained; it does not require a particular Skill tool or additional installed skills.

Start from the user's plan and relevant repository evidence. Identify unresolved assumptions, tradeoffs, constraints, failure modes, and domain terms. Ask one focused question at a time, starting with the uncertainty most likely to change the plan. Reuse answers and prior decisions; do not ask for facts available in the code or provided context.

As decisions become clear, record their context, choice, alternatives, and consequences in the project's existing decision documents. Add agreed domain terms and definitions to an existing glossary. If no suitable location exists, use `docs/decisions/` and `docs/glossary.md`. Keep proposals visibly distinct from accepted decisions and avoid inventing rationale or private information.

Continue until the material uncertainties are resolved, the user ends the interview, or a decision needs evidence that is unavailable. Then summarize decisions, remaining questions, and changed document paths. This planning command does not authorize application changes or deployment.
