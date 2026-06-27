local mainMod  = "SUPER"
local terminal = "kitty"
local browser  = "chromium"
local qsm      = "~/.config/hypr/scripts/qs_manager.sh"

-- apps
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + R",     hl.dsp.exec_cmd("wofi --show drun"))

-- window control
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

-- workspaces 1-9, 0 = 10 (switch via qs_manager, SHIFT = move active window)
local ws_keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }
for i, key in ipairs(ws_keys) do
    hl.bind(mainMod .. " + " .. key,         hl.dsp.exec_cmd(qsm .. " " .. i))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd(qsm .. " " .. i .. " move"))
end

-- mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- screenshot region to clipboard
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))

-- tile every window on the active workspace
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(
    "ws=$(hyprctl activeworkspace -j | jq -r '.id'); " ..
    "hyprctl clients -j | jq -r --argjson ws \"$ws\" " ..
    "'.[] | select(.workspace.id == $ws) | .address' | " ..
    "while read addr; do hyprctl dispatch settiled address:$addr; done"))

-- quickshell popups / overlays
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(qsm .. " toggle wallpaper"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("bash " .. qsm .. " toggle calendar"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("bash " .. qsm .. " toggle music"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("bash " .. qsm .. " toggle network"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("bash " .. qsm .. " toggle volume"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("~/Projects/zerkal/zerkal.sh toggle"))
