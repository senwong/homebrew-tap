# senwong Homebrew Tap

## Term Work

Save and restore terminal tabs and Claude Code sessions on macOS.

```sh
brew install senwong/tap/term-work
term-work-setup
```

Requires a supported terminal (Kaku, WezTerm, iTerm2 or Ghostty) and Claude Code.
Homebrew installs Python automatically. The setup command installs a per-user
LaunchAgent and the `work` command. `term-work` is also available as the
Homebrew CLI command name.

```sh
work list
work restore
```

Update with `brew upgrade term-work`, then run `term-work-setup` again.
Uninstall with `term-work-setup --uninstall`, then `brew uninstall term-work`.
Session records remain on the user's computer. Do not use `brew services` to
start another watcher.

[Source, documentation and releases](https://github.com/senwong/term-work)

This is an independent tap, not homebrew/core. MIT License; see the upstream project.
