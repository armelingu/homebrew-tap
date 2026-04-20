# armelingu/homebrew-tap

Official [Homebrew](https://brew.sh) tap for the CLI tools maintained by
[@armelingu](https://github.com/armelingu).

## Formulae

| Formula | Description | Homepage |
| --- | --- | --- |
| `mac-manager` | Monitor your Mac's health, security and hardware from the terminal. | [mac-manager](https://github.com/armelingu/mac-manager) |

## Usage

### Install

```bash
brew tap armelingu/tap
brew install mac-manager
```

Or in a single command:

```bash
brew install armelingu/tap/mac-manager
```

### Update

```bash
brew update
brew upgrade mac-manager
```

### Uninstall

```bash
brew uninstall mac-manager
brew untap armelingu/tap
```

## Repository layout

```
homebrew-tap/
├── Formula/
│   └── mac-manager.rb   # Homebrew formula for Mac Manager
├── .github/
│   └── workflows/
│       └── test.yml     # CI: runs `brew audit` and test installs every formula
└── README.md
```

## Contributing

Bug reports, new formulae and fixes are welcome. Please open issues and pull
requests in this repository.

New formulae must pass `brew audit --strict --online Formula/<name>.rb`
and `brew install --build-from-source Formula/<name>.rb` before being
merged.

## License

Each formula in this tap links to its own upstream project and is licensed
under the same terms as that project. This repository's configuration files
(`README.md`, CI workflows, etc.) are released under the
[MIT License](https://opensource.org/licenses/MIT).
