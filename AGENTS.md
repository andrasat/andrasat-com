# Repository guidance

This is the canonical project guide for coding agents, including Codex, Copilot, Gemini, and OpenCode. Read the files relevant to the task; a documentation edit does not require loading the design workflows.

## Project and task context

andrasat.com is Andra Satria's professional portfolio, built with Nuxt, Vue, TypeScript, and Tailwind CSS. Use the existing framework, components, and build pipeline. [package.json](package.json), [nuxt.config.ts](nuxt.config.ts), and the lockfile are the source of truth for dependencies and commands.

| Task | Read as needed |
|---|---|
| Content, routes, or product intent | [PRODUCT.md](PRODUCT.md), the affected file in [pages/](pages/) or [components/](components/) |
| Visual or interaction changes | [DESIGN.md](DESIGN.md), [assets/css/tailwind.css](assets/css/tailwind.css), [tailwind.config.ts](tailwind.config.ts), the affected component |
| Shared layout or navigation | [layouts/default.vue](layouts/default.vue), [components/PageContainer.vue](components/PageContainer.vue), header or footer |
| Nuxt setup or server behavior | [nuxt.config.ts](nuxt.config.ts), [server/api/](server/api/), [utils/](utils/) |
| Deployment or release work | [.github/workflows/action.yml](.github/workflows/action.yml), relevant [scripts/](scripts/) and [configs/](configs/) |
| Skill maintenance or explicit invocation | [Impeccable](.github/skills/impeccable/SKILL.md), [grill-with-docs](.agents/skills/grill-with-docs/SKILL.md) |

Vue components use `<script setup lang="ts">` and Nuxt auto-imports where applicable. Reuse Tailwind utilities and semantic color tokens. The configured typeface is Commissioner and the installed icon library is Phosphor. Aliases `~`, `@assets`, and `@components` are defined in Nuxt config. Check source before relying on older plans or examples of routes.

## Scope and safeguards

- Preserve factual content, dynamic values, link destinations, keyboard access, visible focus, theme behavior, and reduced-motion fallbacks. For UI work, follow the detailed contract in DESIGN.md.
- Work through the authorized change and resolve findings caused by it. Use existing decisions and reasonable assumptions; ask only when a missing decision materially changes scope, content, or risk. Bundled skill workflows reuse prior authorization and the current agent's available tools.
- Keep credentials, SSH keys, secret environment values, and private project details out of logs, patches, and public content. Do not infer permission to publish or deploy from a request to edit code.
- A push to `main` triggers semantic release and production deployment. Running release, SSH, deployment, or nginx migration commands requires authorization for that action. Do not edit generated `.nuxt/` or `.output/` files.

## Validation and completion

Use Bun as documented in [README.md](README.md) and CI. Install with `bun install` only when dependencies are needed. Existing scripts are:

| Command | Use |
|---|---|
| `bun run dev` | Local development server |
| `bun run lint` | ESLint checks |
| `bun run lint:design` | Impeccable detector for components, pages, and layouts |
| `bun run build` | Production build |
| `bun run generate` | Static generation when that output is needed |
| `bun run preview` | Serve the production build locally |

Select checks for the affected behavior. Documentation-only changes need reference and instruction consistency checks. For UI changes, inspect the affected routes, relevant states, themes, and responsive widths from DESIGN.md. Run lint/build when the changed application behavior warrants them. The pre-commit hook invokes lint-staged for staged JavaScript, TypeScript, and Vue files; do not bypass it to hide a failure.

[tests/production-contract.test.mjs](tests/production-contract.test.mjs) checks route status and rendered HTML against a running server: `node --test tests/production-contract.test.mjs`. It defaults to `http://127.0.0.1:3000`; `BASE_URL` can select another authorized target. It is relevant to route/content/SSR changes and does not replace visual or interaction checks. There is no `test` or `typecheck` package script.

Finish when the requested result is implemented and relevant checks are complete. Fix observed in-scope defects, then recheck the affected behavior; broaden work only for a concrete remaining risk. Report what changed, what actually ran, and any blocker or unverified behavior. Do not claim a build, browser check, or test that was not run.
