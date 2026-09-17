---
name: commit
description: Write commit messages for the NikVim repo following Conventional Commits, with scope derived from the module touched. Use whenever creating a git commit in this repository.
---

# NikVim commit convention

This repo uses [Conventional Commits](https://www.conventionalcommits.org/) because releases and the changelog are generated from commit history with git-cliff. The commit message is the source of truth — write it carefully.

## Format

```
<type>(<scope>): <description>

[optional body]
```

No footers. In particular, do **not** add a `Co-Authored-By: Claude` (or any AI attribution) trailer to commits in this repo — the user has explicitly opted out of that for NikVim.

## Type

Pick the type that matches the actual change, not the file touched:

- `feat` — a new capability (new keymap, new option behavior, new autocmd)
- `fix` — corrects broken/wrong behavior
- `docs` — README, CONTRIBUTING, comments, doc files
- `chore` — repo maintenance with no source behavior change (LICENSE, tooling, config files, `.gitignore`, CI setup)
- `refactor` — restructuring code with no behavior change
- `perf` — performance improvement
- `style` — formatting only, no logic change
- `test` — adding or fixing tests
- `revert` — reverts a previous commit

## Scope

Scope = the module the change lives in, taken from the file path under `lua/`:

- `lua/keymaps.lua` → `feat(keymaps): ...`
- `lua/options.lua` → `feat(options): ...`
- `lua/autocmds.lua` → `fix(autocmds): ...`
- A specific plugin config, e.g. `lua/plugins/telescope.lua` → `feat(telescope): ...`

For changes that aren't tied to one module (repo-root files like `LICENSE`, `README.md`, `CONTRIBUTING.md`, or changes spanning multiple modules), omit the scope entirely: `chore: add MIT license`.

If a change touches multiple unrelated modules, split it into multiple commits — one scope per commit — rather than picking one scope or omitting it.

## Description

- Imperative mood, lowercase, no trailing period: `add`, not `Added` or `adds`
- Keep the summary line short (~50-72 chars); put anything else in an optional body paragraph below a blank line
- Only add a body when the *why* isn't obvious from the diff (e.g. a non-obvious tradeoff or a bug's root cause) — don't restate what the diff already shows

## Examples

```
feat(keymaps): add window navigation with <C-hjkl>
```

```
fix(autocmds): restore cursor position only for normal buffers

Applying it to special buffers (terminal, help) was causing the
cursor to jump on open.
```

```
chore: add MIT license
```
