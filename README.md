# App4 Homebrew Tap

Homebrew formulae and casks for the [App4](https://app4.dev) developer tools:
the `app4` command-line interface and the App4 Studio desktop application.

## Install

Homebrew 6 asks you to trust a third-party tap once; after that the short
names work:

```sh
brew tap app4-ai/tap
brew trust app4-ai/tap

brew install --cask app4-studio   # App4 Studio desktop app (macOS) + the CLI
brew install app4-cli             # CLI only (macOS and Linux); `app4` is an alias
```

Without trusting the whole tap, the fully qualified names install and trust
one item at a time:

```sh
brew install app4-ai/tap/app4-cli
brew install --cask app4-ai/tap/app4-studio   # after the line above
```

## What is in the tap

| Name          | Kind    | Installs                          |
|---------------|---------|-----------------------------------|
| `app4-cli`    | formula | the `app4` command (`app4` is an alias) |
| `app4-studio` | cask    | `App4 Studio.app`, depends on `app4-cli` |

Formula and cask files are published here automatically by the release
pipelines of the respective projects; the tap's CI installs both on every change.

## Update

```sh
brew update
brew upgrade app4-cli
brew upgrade --cask app4-studio
```

The `app4` command does not update itself when installed through Homebrew;
`brew upgrade` is the single source of truth on this channel.

## Troubleshooting

- `brew doctor` reports the usual environment problems.
- `brew reinstall app4-cli` repairs a broken install.
- Issues with the tap itself go to this repository's
  [issue tracker](https://github.com/app4-ai/homebrew-tap/issues).

## License

The tap files are licensed under the [Apache License 2.0](LICENSE). The
software they install carries its own license.
