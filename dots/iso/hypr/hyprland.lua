-- Refer to the wiki for more information.
-- https://wiki.hyprland.org/Configuring/

-- See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({
    output = "*",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

--## ENVIRONMENT VARIABLES ###

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_THEME", "BreezeX-RoséPine")

--## LOOK AND FEEL ###

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd("alacritty --class floating"))
hl.bind(mainMod .. " + CONTROL + return", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mainMod .. " + HOME", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("SUPER + SHIFT + HOME", hl.dsp.exec_cmd("grimblast copy output"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })

hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "2",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "3",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "4",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "5",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "6",
    monitor = "HDMI-A-2",
})

hl.workspace_rule({
    workspace = "7",
    monitor = "HDMI-A-2",
})

hl.workspace_rule({
    workspace = "8",
    monitor = "HDMI-A-2",
})

hl.workspace_rule({
    workspace = "9",
    monitor = "HDMI-A-2",
})

hl.workspace_rule({
    workspace = "10",
    monitor = "HDMI-A-2",
})

hl.window_rule({
    match = {
        class = "^(?!(kitty|ghostty|foot))",
    },
    no_blur = true,
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        --col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col = {
            active_border = { colors = { "rgb(241,111,121)", "rgb(245,148,129)" } },
            inactive_border = "rgba(595959aa)",
        },
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 0,
        rounding_power = 2,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            ignore_opacity = true,
            vibrancy = 0.1696,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
        enabled = true,
        -- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    },
    -- Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
    -- "Smart gaps" / "No gaps when only"
    -- uncomment all if you wish to use that.
    -- workspace = w[tv1], gapsout:0, gapsin:0
    -- workspace = f[1], gapsout:0, gapsin:0
    -- windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
    -- windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
    -- windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
    -- windowrulev2 = rounding 0, floating:0, onworkspace:f[1]
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
        preserve_split = true, -- You probably want this
    },
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
        new_status = "master",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
        enable_anr_dialog = false,
        vrr = 1, --Global FreeSync hell yeah
    },
    render = {
        cm_sdr_eotf = 2,
        --cm_auto_hdr = 0 #annoying
    },
    --## INPUT ###
    -- https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#gestures
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    -- Example per-device config
    -- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
    --device {
    --    name = epic-mouse-v1
    --    sensitivity = -0.5
    --}
    --## KEYBINDINGS ###
    -- See https://wiki.hyprland.org/Configuring/Keywords/
    -- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    --bind = $mainMod Control, return, exec, foot
    --bind = $mainMod, D, exec, wofi --show drun --allow-images
    --bind = $mainMod, J, togglesplit, # dwindle
    -- Move focus with mainMod + arrow keys
    -- Switch workspaces with mainMod + [0-9]
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    -- Scroll through existing workspaces with mainMod + scroll
    -- Move/resize windows with mainMod + LMB/RMB and dragging
    -- Custom binds
    --## WINDOWS AND WORKSPACES ###
    --Don't blur anything EXCEPT what's specified here
})

hl.window_rule({
    match = { class = "^(Overwatch\\.exe)$" },
    fullscreen = true,
    confine_pointer = true,
})

hl.on("hyprland.start", function()
    hl.exec_cmd("swaync & waybar & awww-daemon")
    hl.exec_cmd("gammastep-indicator -l 53.9:-122.7")
    -- hl.exec_cmd("udiskie &")
    hl.exec_cmd("easyeffects -w &")
end)

