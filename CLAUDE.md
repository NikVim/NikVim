# CLAUDE.md

Context for Claude Code (or any Claude session) working in this repository.

## About the project

NikVim is built on a simple idea: Neovim should feel great from the first launch. It is an opinionated Neovim configuration that provides a polished, modern experience with carefully chosen defaults. Every decision is intentional, reducing unnecessary complexity while preserving the speed and flexibility that make Neovim powerful.

NikVim does not aim to become an IDE or hide Neovim behind layers of abstraction. It rethinks how users interact with Neovim through thoughtful UI improvements, discoverable workflows, and sensible defaults where they improve the experience.

The configuration is modular — start with a solid foundation and enable only what's needed. NikVim expects users to learn the fundamentals of Neovim; modal editing stays at the core. The goal is not to replace Neovim's editing model, but to make the surrounding experience more intuitive, consistent, and enjoyable.

## Principles

- A better default for Neovim.
- Opinionated, but never restrictive.
- Beautiful by default.
- Native first whenever practical.
- Modular by design.
- Easy to understand, customize, and extend.
- Modern interactions that complement—not replace—Neovim.

Weigh changes against these. Prefer native Neovim APIs (`vim.pack`, built-in LSP, etc.) over pulling in a plugin unless the plugin clearly earns its place.

## Repo status

Early, work in progress. Currently native-config-only (options, keymaps, autocmds) — no plugins yet. See open [milestones](https://github.com/NikVim/nikvim/milestones) for current scope.

## Conventions

- **Commits**: follow [.claude/skills/commit/SKILL.md](.claude/skills/commit/SKILL.md) — Conventional Commits, scoped per module, no AI co-author trailer.
- **Contributing**: see [CONTRIBUTING.md](CONTRIBUTING.md) for the PR flow, coding conventions, and local testing.
- **Module structure**: one concern per file (e.g. `options.lua`, `keymaps.lua`, `autocmds.lua`). Keep that boundary when adding code — don't mix concerns into one file.
- No dead code, no commented-out blocks, no speculative config for hypothetical future use.
