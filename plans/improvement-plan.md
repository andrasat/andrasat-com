# Plan: Enhance Design & Engagement for andrasat.com

## Objective
Upgrade the visual appeal of the personal website and introduce interactive "fun" elements to increase user engagement.

## Proposed Changes

### 1. Visual Overhaul (UI/UX)
*   **Global Theme**: Enforce a modern, polished dark mode using the existing color palette (`licorice`, `aero`, `coral`).
*   **Hero Section (Home)**:
    *   Implement a **Typewriter Effect** for the "Hello World" intro and role descriptions.
    *   Add a subtle **Animated Background** (e.g., floating geometric shapes or a "constellation" effect using canvas/CSS).
*   **Navigation**:
    *   Upgrade the simple popover menu to a **Floating Dock** or a **Glassmorphism Header** for better accessibility and style.
*   **Experiences Page**:
    *   Transform the current list into a **Vertical Interactive Timeline**.
    *   Add hover effects to experience cards.

### 2. Engagement & "Fun" Features
*   **Interactive Skills Section**:
    *   Make skill icons float or react to mouse movement (parallax effect).
    *   Add tooltips with "proficiency levels" or fun facts about each tool.
*   **"Gamer Mode" (Easter Egg)**:
    *   Implement a **Konami Code** listener (`Up, Up, Down, Down, Left, Right, Left, Right, B, A`).
    *   **Effect**: When triggered, unlock a hidden mini-game (e.g., "Bug Zapper" where you click floating bugs) or change the site theme to a Retro Terminal style.
*   **Footer**:
    *   Add a dynamic "Visitor Counter" (mock or real if API allowed) or a "Quote of the Day" API integration.

### 3. Content Improvements
*   **Blog**:
    *   Replace the "Under Maintenance" text with a **Masonry Layout** of placeholder blog post cards to showcase the design potential.
*   **Contact**:
    *   Add a functional-looking "Terminal" style contact form (visual only, or `mailto` link).

## Tech Stack Additions
*   **Animations**: CSS Transitions & `@vueuse/core` (for parallax/mouse tracking).
*   **Icons**: Continue using FontAwesome & Devicon.

## Execution Steps
1.  **Refactor Layout**: Update `layouts/default.vue` and `components/HeaderMenu.vue`.
2.  **Home Page Revamp**: Update `pages/index.vue` with animations.
3.  **Timeline Component**: Create `components/ExperienceTimeline.vue` and update `pages/experiences.vue`.
4.  **Fun Feature**: Create `components/KonamiEasterEgg.vue`.
5.  **Review**: Verify responsiveness and "fun" factor.
