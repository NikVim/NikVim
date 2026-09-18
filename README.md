# NikVim

> **Work in progress.** NikVim is under active early development and is not yet ready for daily use. Expect breaking changes without notice until a stable release is tagged.

NikVim is built on a simple idea: Neovim should feel great from the first launch.

It is an opinionated Neovim configuration that provides a polished, modern experience with carefully chosen defaults. Every decision is intentional, reducing unnecessary complexity while preserving the speed and flexibility that make Neovim powerful.

NikVim does not aim to become an IDE or hide Neovim behind layers of abstraction. Instead, it rethinks how users interact with Neovim by introducing thoughtful UI improvements, discoverable workflows, and sensible defaults where they improve the experience.

The configuration remains modular. Start with a solid foundation and enable only the features you need. Whether you're writing code, editing Markdown, or simply working with plain text, NikVim should stay lightweight, focused, and adaptable.

NikVim expects users to learn the fundamentals of Neovim. Modal editing remains at the core of the experience. The goal is not to replace Neovim's editing model, but to make the surrounding experience more intuitive, consistent, and enjoyable.

## Principles

- A better default for Neovim.
- Opinionated, but never restrictive.
- Beautiful by default.
- Native first whenever practical.
- Modular by design.
- Easy to understand, customize, and extend.
- Modern interactions that complement—not replace—Neovim.

## Status

The first milestone, [`Sensible defaults`](https://github.com/NikVim/nikvim/milestones), covers the native Neovim baseline (options, keymaps, autocmds) with no plugins yet. Install instructions will be added once there's something usable to install.

## Requirements

Neovim 0.12+. `lsp.lua` relies on `vim.lsp.config()` and `vim.lsp.enable()`, which don't exist on older versions.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
