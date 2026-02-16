# GEMINI Project Context: andrasat.com

## Project Overview
This is the personal website of **Andra Satria**, a Senior Full Stack Developer. It is built using **Nuxt 3** and served as a static or server-side rendered application. The site showcases professional experiences, skills, and blog posts.

### Key Technologies
- **Framework:** [Nuxt 3](https://nuxt.com/) (Vue 3 with Composition API)
- **Language:** [TypeScript](https://www.typescriptlang.org/)
- **Styling:** [Tailwind CSS](https://tailwindcss.com/)
- **Package Manager:** [Bun](https://bun.sh/)
- **Fonts:** Red Hat Display & Red Hat Mono (via `@nuxtjs/google-fonts`)
- **Icons:** [Devicon](https://devicon.dev/)
- **Versioning:** Semantic Release

## Architecture
- `pages/`: Contains the application views (e.g., `index.vue`, `experiences.vue`, `blog.vue`).
- `components/`: Reusable Vue components (e.g., `MyHeader.vue`, `MyFooter.vue`, `PageContainer.vue`).
- `layouts/`: Defines page layouts (e.g., `default.vue`).
- `assets/`: Static assets like CSS (`tailwind.css`, `sanitize.css`) and images.
- `utils/`: Helper functions (e.g., `date.ts`).
- `server/api/`: Server-side API routes.
- `scripts/`: Maintenance and setup scripts.

## Building and Running

### Development
Start the development server with hot-module replacement:
```bash
bun run dev
```

### Production
Build the application for production:
```bash
bun run build
```

Generate a static version of the site:
```bash
bun run generate
```

Preview the production build locally:
```bash
bun run preview
```

### Quality Control
Run ESLint to check for code style and errors:
```bash
bun run lint
```

## Development Conventions

### Vue & TypeScript
- Use `<script setup lang="ts">` for all Vue components.
- Prefer functional and declarative patterns.
- Leverage Nuxt auto-imports for components, composables, and utilities.

### Styling
- Use Tailwind CSS utility classes directly in templates.
- Custom colors and animations are defined in `tailwind.config.ts`.
- Standardized layout spacing is managed via `PageContainer.vue`.

### Aliases
- `~`: Project root
- `@assets`: `assets/` directory
- `@components`: `components/` directory

## Continuous Integration/Deployment
- **GitHub Actions:** Automated workflows are located in `.github/workflows/`.
- **Semantic Release:** Automates the versioning and changelog generation based on commit messages.
- **Husky & lint-staged:** Ensures code is linted before every commit.
