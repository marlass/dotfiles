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
