# hypr

Hyprland configuration — a single `hyprland.conf` with structured sections,
caelestia-style animations, and live wallpaper-driven theming via
[astrium](https://github.com/Rise-zen/astrium).

## Requirements

- Hyprland 0.40+
- `hyprctl` on `PATH`

## Install

```sh
git clone https://github.com/Rise-zen/dotfiles ~/.config/hypr
```

Then log into Hyprland.

## Keybinds

| Key | Action |
|-----|--------|
| `SUPER + SPACE` | terminal (kitty) |
| `SUPER + E` | browser (chromium) |
| `SUPER + R` | launcher (wofi) |
| `SUPER + Q` | close window |
| `SUPER + F` | toggle floating |
| `SUPER + 1..0` | switch workspace |
| `SUPER + SHIFT + 1..0` | move window to workspace |
| `SUPER + SHIFT + S` | screenshot region to clipboard |
| `SUPER + drag/right-drag` | move / resize window |

## Live theming

Border and shadow colours are driven live by
[astrium](https://github.com/Rise-zen/astrium), which extracts a palette from
the wallpaper and writes `~/.cache/astrium/colors-hyprland.conf` (sourced at the
end of the config) while also pushing changes via `hyprctl keyword`. The config
works fine without it — defaults are baked in.

## Note

The status bar ([ilyamiro/quickshell](https://github.com/ilyamiro/dotfiles))
is **not** included. Keybinds that reference `scripts/quickshell/` expect it
installed separately.
