hl.on("hyprland.start", function()
    -- session + daemons
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("hyprpolkitagent")
    hl.exec_cmd("swayosd-libinput-backend")
    hl.exec_cmd("playerctld daemon")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- project daemons
    hl.exec_cmd("cp ~/Projects/lyrics/target/release/lyrics ~/.local/bin/lyrics")
    hl.exec_cmd("lyrics --json")
    hl.exec_cmd("astrium watch --interval 200")
    hl.exec_cmd("~/.config/hypr/scripts/volume_listener.sh")

    -- shells
    hl.exec_cmd("quickshell -p $HOME/.config/hypr/scripts/quickshell/Shell.qml")
    hl.exec_cmd("~/Projects/zerkal/zerkal.sh start")
    hl.exec_cmd("python3 ~/.config/hypr/scripts/quickshell/focustime/focus_daemon.py")
end)
