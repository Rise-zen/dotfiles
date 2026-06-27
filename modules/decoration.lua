-- shadow colour is overridden live by astrium (colors-hyprland.lua)
hl.config({
    decoration = {
        rounding         = 18,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 15,
            render_power = 4,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled           = true,
            size              = 8,
            passes            = 3,
            new_optimizations = true,
            ignore_opacity    = true,
            xray              = true,
            vibrancy          = 0.1696,
        },
    },
})
