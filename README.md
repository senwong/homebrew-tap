# senwong Homebrew Tap

## Kaku Work

Save and restore Kaku terminal tabs and Claude Code sessions on macOS.

```sh
brew install senwong/tap/kaku-work
kaku-work-setup
```

Requires Kaku and Claude Code. Homebrew installs Python automatically.
The setup command installs a per-user LaunchAgent and the `work` command.
`kaku-work` is also available as the Homebrew CLI command name.

```sh
work list
work restore
```

Update with `brew upgrade kaku-work`, then run `kaku-work-setup` again.
Uninstall with `kaku-work-setup --uninstall`, then `brew uninstall kaku-work`.
Session records remain on the user's computer. Do not use `brew services` to
start another watcher.

[Source, documentation and releases](https://github.com/senwong/kaku-work)

This is an independent tap, not homebrew/core. MIT License; see the upstream project.
