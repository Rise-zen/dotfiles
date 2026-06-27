-- Hyprland native Lua config. Each module owns its own domain end-to-end.
-- dofile (not require) so `hyprctl reload` re-runs everything fresh.

local dir = os.getenv("HOME") .. "/.config/hypr/modules/"

local modules = {
    "monitors",
    "env",
    "general",
    "decoration",
    "input",
    "animations",
    "windowrules",
    "keybindings",
    "autostart",
}

for _, name in ipairs(modules) do
    dofile(dir .. name .. ".lua")
end

-- live palette from astrium (border/shadow colours, applied live via hyprctl)
pcall(dofile, os.getenv("HOME") .. "/.cache/astrium/colors-hyprland.lua")
