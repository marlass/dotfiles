# dotfiles

Managed with [chezmoi](https://chezmoi.io).

## Bootstrap a new machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply marlass/dotfiles
```

On first run you'll be asked to pick a profile (`personal` or `work`).
