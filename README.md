# dotfiles

Managed with [chezmoi](https://chezmoi.io).

## Bootstrap a new machine

1. Install Xcode Command Line Tools (provides `git`). A GUI dialog will pop up — click **Install** and wait for it to finish:

   ```sh
   xcode-select --install
   ```

2. Run the chezmoi bootstrap:

   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply marlass/dotfiles
   ```

On first run you'll be asked to pick a profile (`personal` or `work`).

## First apply on a fresh Mac

The bootstrap one-liner runs `chezmoi apply` automatically. A few things need manual intervention during or after that first run:

- **Work profile only:** the Determinate Nix installer runs early and prompts for your macOS password (sudo). Expected.
- **`~/.gitconfig` will fail to render** until 1Password is signed in with CLI integration enabled (see [Manual setup steps](#manual-setup-steps)). Complete those, then re-run:

  ```sh
  chezmoi apply
  ```

## Updating

```sh
chezmoi update
```

Pulls the latest source and re-applies. Safe to run repeatedly.

## Manual setup steps

These can't be (or aren't worth) scripting — do each once per machine after the first apply.

- **Default browser** — System Settings → Desktop & Dock → Default web browser → **Google Chrome**.
- **1Password** — launch the app, sign in, then Settings → Developer → enable:
  - **Integrate with 1Password CLI** — required before any `chezmoi` template or script that reads secrets can work.
  - **Use the SSH agent** — makes 1Password serve SSH keys for auth (git clone, ssh host) and commit signing. Pairs with `~/.ssh/config` already deployed.
  - Optionally **Use Touch ID to unlock the 1Password app**.

  After enabling, add public keys to GitHub / other services via each SSH Key item's "Copy public key" in 1Password.
- **Raycast** — launch and import settings from 1Password.
- **Google Chrome** login (two factor via mobile app as 1p extension is not yet installed) and sync settings there. Authorize extensions (Refined Github, 1Password)
- **Spotify** login (easiest via mobile app)
- **Slack** login
- **Signal** login
