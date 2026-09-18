# Contributing to NikVim

Thanks for considering a contribution. NikVim is opinionated by design, so please open an issue to discuss non-trivial changes before writing code — it saves everyone a wasted PR.

## Proposing a change

1. Check open [issues](https://github.com/NikVim/nikvim/issues) and the [milestones](https://github.com/NikVim/nikvim/milestones) to see if it's already tracked.
2. For anything beyond a small fix, open an issue first describing the problem and proposed approach.
3. Fork the repo and branch off `main`.
4. Open a PR referencing the issue (e.g. `Closes #12`).

## Coding conventions

- Keep modules focused: one concern per file (e.g. `options.lua`, `keymaps.lua`, `autocmds.lua`), matching the module boundaries described in the issue/milestone you're working from.
- Prefer native Neovim APIs over plugins where practical — see the project's "native first" principle.
- No dead code, no commented-out blocks, no speculative config for hypothetical future use.
- Match the surrounding file's style; don't reformat unrelated code in the same PR.

## Testing changes locally

- Point your Neovim config at your local checkout (e.g. symlink or `NVIM_APPNAME`) and verify the change interactively — there's no automated test suite for editor behavior, so manual verification is required.
- Check `:checkhealth` and `:messages` for errors/warnings introduced by your change.
- If you changed keymaps or options, confirm there's no conflict with existing defaults.

## Commit messages

This repo follows [Conventional Commits](https://www.conventionalcommits.org/), since releases and the changelog are generated from commit history with git-cliff.

```
<type>(<scope>): <description>

[optional body]
```

- **Type** reflects the nature of the change: `feat`, `fix`, `docs`, `chore`, `refactor`, `perf`, `style`, `test`, `revert`.
- **Scope** is the module touched, taken from the file path under `lua/` (e.g. `lua/keymaps.lua` → `feat(keymaps): ...`). Omit the scope for repo-root files or changes spanning multiple modules — and split multi-module changes into separate commits instead of picking one scope.
- **Description** is imperative and lowercase, with no trailing period: `add`, not `Added`.
- Add a body only when the *why* isn't obvious from the diff.

See [`.claude/skills/commit/SKILL.md`](.claude/skills/commit/SKILL.md) for the full convention Claude follows in this repo.

Enable the local commit hook to catch format mistakes before they land:

```sh
git config core.hooksPath .githooks
```

## Releases

CHANGELOG.md and GitHub release notes are generated from the commit history with [git-cliff](https://git-cliff.org/), configured in [`cliff.toml`](cliff.toml), only when a release is actually cut — not maintained continuously between merges. This only works if commit messages follow the Conventional Commits format above.

To cut a release, tag the commit and generate the changelog and notes for that tag:

```sh
git tag v0.1.0
git cliff -o CHANGELOG.md
git cliff --latest --strip all -o release-notes.md
```

Commit the updated `CHANGELOG.md` alongside the tag. Use `release-notes.md` as the body when creating the GitHub release, then remove the file — it's a build artifact, not something to commit.
