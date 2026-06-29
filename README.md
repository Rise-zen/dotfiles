# dotfiles

Hyprland configuration for an Arch/CachyOS setup. Wallpaper-driven Material You
theming via [astrium](https://github.com/Rise-zen/astrium), a Quickshell bar,
and a standalone app launcher.

## Layout

```
hyprland.conf          entry point, sources every module
modules/
  monitors.conf        outputs / resolutions
  env.conf             environment variables
  general.conf         gaps, borders, resize_on_border
  decoration.conf      blur, rounding, shadows
  input.conf           keyboard / touchpad
  animations.conf      bezier curves + animation timings
  windowrules.conf     per-app rules (OBS/Chrome transparency, ...)
  keybindings.conf     all keybinds
  autostart.conf       exec-once daemons, theming, shells
```

The Quickshell bar, controller scripts and the app launcher live under
`scripts/` and are intentionally gitignored.

## Dependencies

```
hyprland quickshell awww kitty
jq inotify-tools
swayosd cliphist playerctl
otf-hasklig-nerd
```

Plus the companion projects:

- [astrium](https://github.com/Rise-zen/astrium) — wallpaper -> palette engine
- [applauncher](https://github.com/Rise-zen/applauncher) — Quickshell launcher

## Install

```sh
git clone git@github.com:Rise-zen/dotfiles.git ~/.config/hypr
```

Install astrium and put it on your PATH:

```sh
git clone git@github.com:Rise-zen/astrium.git ~/Projects/astrium
cargo build --release --manifest-path ~/Projects/astrium/Cargo.toml
install -Dm755 ~/Projects/astrium/target/release/astrium ~/.local/bin/astrium
```

Reload Hyprland with `hyprctl reload` or relog.

## Keybinds

| Key | Action |
| --- | --- |
| `Super` | toggle app launcher |
| `Super + Space` | terminal (kitty) |
| `Super + E` | browser |
| `Super + Q` | close window |
| `Super + F` | toggle floating |
| `Super + 1..0` | switch workspace |
| `Super + Shift + 1..0` | move window to workspace |
| `Super + LMB / RMB` | move / resize window |

## Theming

`astrium watch` polls awww for wallpaper changes and rewrites the palette files
(`~/.cache/astrium/`, `/tmp/qs_colors.json`). The shell reads the palette over a
`FileView` watch, so a wallpaper swap recolors everything within a second.
