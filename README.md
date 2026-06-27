# hypr

Hyprland configuration written in **native Lua** — no `.conf`, no compiler, no
external preprocessor. Hyprland 0.50+ ships a real Lua config loader; this repo
uses it directly. Every setting is plain Lua, split into self-contained modules.

## Requirements

- Hyprland **0.55+** (built with Lua support — the default on recent Arch/CachyOS)
- `hyprctl` on `PATH`

## Layout

```
hyprland.lua        entry point — dofiles each module in order
modules/
  monitors.lua      outputs / modes
  env.lua           environment variables
  general.lua       borders, gaps
  decoration.lua    rounding, shadow, blur
  input.lua         keyboard, touchpad
  animations.lua    bezier curves + animation timings
  windowrules.lua   window rules
  keybindings.lua   keybinds
  autostart.lua     exec-on-start
```

`hyprland.lua` uses `dofile` (not `require`) so `hyprctl reload` re-runs every
module fresh, including live edits.

## Install

```sh
git clone <this-repo> ~/.config/hypr
```

Then log into Hyprland. With no `hyprland.conf` present, Hyprland loads
`hyprland.lua` automatically. Edit a module and run `hyprctl reload`.

## Keybinds

| Key | Action |
|-----|--------|
| `SUPER + SPACE` | terminal |
| `SUPER + E` | browser |
| `SUPER + R` | launcher |
| `SUPER + Q` | close window |
| `SUPER + F` | toggle floating |
| `SUPER + 1..0` | switch workspace |
| `SUPER + SHIFT + 1..0` | move window to workspace |
| `SUPER + SHIFT + S` | screenshot region to clipboard |
| `SUPER + drag/right-drag` | move / resize window |

## Live theming

Border and shadow colours are driven live by
[astrium](https://github.com/zerkal-beta/astrium), which extracts a palette from
the wallpaper and writes `~/.cache/astrium/colors-hyprland.lua` (loaded at the
end of `hyprland.lua`) while also pushing changes via `hyprctl keyword`. The
config works fine without it — defaults are baked into the modules.

## Note

The status bar (an [ilyamiro/quickshell](https://github.com/ilyamiro/dotfiles)
config) is **not** included here. Keybinds that reference
`scripts/quickshell/` expect it to be installed separately.
