# Pexip Tap

Homebrew formulae for Pexip tools.

## Available formulae

| Formula      | Version   | Description                                                    | Platforms                   |
| ------------ | --------- | -------------------------------------------------------------- | --------------------------- |
| `vsclient`   | 1.3       | Pexip Endpoint Provisioning Tool (endpoint management CLI)     | macOS (Apple Silicon/Intel) |
| `vsclient@2` | 2.0-BETA1 | Pexip Endpoint Provisioning Tool, latest 2.x beta              | macOS (Apple Silicon/Intel) |

## How do I install these formulae?

`brew install pexip/tap/<formula>`

Or `brew tap pexip/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "pexip/tap"
brew "<formula>"
```

### vsclient

```sh
brew install pexip/tap/vsclient
vsclient --help
```

Upgrade to the latest version with `brew upgrade vsclient`.

### vsclient@2 (beta)

Installs the latest 2.x beta. It provides the same `vsclient` command as `vsclient`, so only one of the two can be installed at a time:

```sh
brew uninstall vsclient   # if installed
brew install pexip/tap/vsclient@2
vsclient version
```

Switch back with `brew uninstall vsclient@2 && brew install pexip/tap/vsclient`.

## Updating a formula

`vsclient` installs prebuilt binaries from
`https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v<version>/`.
To release a new version:

1. In `Formula/vsclient.rb`, update `version` and the version in both `url` lines.
2. Recompute the checksum for each architecture and update the matching `sha256`:

   ```sh
   curl -fsSL https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v<version>/vsclient_darwin_arm64.zip | shasum -a 256
   curl -fsSL https://s3.eu-west-1.amazonaws.com/download.vmr.vc/public/software/vsclient/v<version>/vsclient_darwin_amd64.zip | shasum -a 256
   ```

3. Lint the formula:

   ```sh
   brew style Formula/vsclient.rb
   ```

4. Commit to a branch, then test the install from your local checkout (Homebrew only installs formulae from a tap, and tapping a local path clones its committed state):

   ```sh
   brew tap pexip/tap "$PWD"
   brew install pexip/tap/vsclient
   brew test pexip/tap/vsclient
   brew audit --strict --formula pexip/tap/vsclient
   ```

   Clean up afterwards with `brew uninstall vsclient && brew untap pexip/tap`.

### vsclient@2

Ship a new beta with the same steps in `Formula/vsclient@2.rb`, with these differences:

- Each zip contains an arch-suffixed binary (`vsclient_darwin_arm64` / `vsclient_darwin_amd64`), which `install` renames to `vsclient`. Check the new zips with `unzip -l` in case the file names change.
- `brew style Formula/vsclient@2.rb` run against the checkout reports a `FormulaAudit/Conflicts` offense. Homebrew only reads the tap's `style_exceptions/` allowlist for tapped formulae, so lint with `brew style pexip/tap/vsclient@2` after `brew tap pexip/tap "$PWD"`.
- The test runs `vsclient version`, because the 2.x `--help` output doesn't include the version.
- Update the version in the "Available formulae" table.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
