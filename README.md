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

## Updating

```sh
chezmoi update
```

Pulls the latest source and re-applies. Safe to run repeatedly.

## Manual setup steps

These can't be (or aren't worth) scripting — do each once per machine after the first apply.

- **Default browser** — System Settings → Desktop & Dock → Default web browser → **Google Chrome**.
- **1Password** — launch the app, sign in, then Settings → Developer → enable **"Integrate with 1Password CLI"** (and optionally "Use Touch ID to unlock the 1Password app"). Required before any `chezmoi` template or script that reads secrets can work.
