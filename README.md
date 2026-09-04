# App4 Homebrew Tap

Homebrew formulae and casks for the [App4](https://app4.dev) developer tools:
the `app4` command-line interface and the App4 Studio desktop application.

## Install

```sh
# CLI (macOS and Linux)
brew install app4-ai/tap/app4-cli

# Studio desktop app (macOS) — installs the CLI as a dependency
brew install --cask app4-ai/tap/app4-studio
```

Both commands add this tap on first use. Once the tap is added, the short
names work too:

```sh
brew tap app4-ai/tap
brew install app4          # alias of app4-cli
```

## What is in the tap

| Name          | Kind    | Installs                          |
|---------------|---------|-----------------------------------|
| `app4-cli`    | formula | the `app4` command (`app4` is an alias) |
| `app4-studio` | cask    | `App4 Studio.app`, depends on `app4-cli` |

Formula and cask files are published here automatically by the release
pipelines of the respective projects; the first public release is being
prepared.

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
