# Pexip Tap

Homebrew formulae for Pexip tools.

## Available formulae

| Formula    | Version | Description                                                    | Platforms                   |
| ---------- | ------- | -------------------------------------------------------------- | --------------------------- |
| `vsclient` | 1.3     | Pexip Endpoint Provisioning Tool (endpoint management CLI)     | macOS (Apple Silicon/Intel) |

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

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
