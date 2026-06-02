-- monitors
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1.2,
})



-- programs
local terminal = "ghostty"
local fileManager = "thunar"
local menu = "walker"

-- autostart
hl.on("hyprland.start", function()
    -- hl.exec_cmd("elephant")
    -- hl.exec_cmd("wayle panel start")
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("fcitx5")

end)

-- misc
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_SIZE", "20")

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

hl.config({ xwayland = { force_zero_scaling = true } })

-- appearance
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border = { colors = {"rgba(73c0ffee)", "rgba(33ccffee)"}, angle = 45},
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 10,

        active_opacity = 0.93,
        inactive_opacity = 0.7,

        blur = {
            enabled = true,
            xray = false,
            special = false,
            ignore_opacity = true,
            new_optimizations = true,
            popups = true,
            input_methods = true,
            size = 8,
            passes = 2,
        },

        shadow = {
            enabled = true,
            range = 20,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        }
    }
})

-- animations
--     animations {
--     enabled = true

--     # Animation curves
hl.curve("quick", { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
--     bezier = specialWorkSwitch, 0.05, 0.7, 0.1, 1
hl.curve("specialWorkSwitch", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1}}})
--     bezier = emphasizedAccel, 0.3, 0, 0.8, 0.15
hl.curve("emphasizedAccel", { type = "bezier", points = { {0.03, 0}, {0.8, 0.15}}})
--     bezier = emphasizedDecel, 0.05, 0.7, 0.1, 1
hl.curve("emphasizedDecel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1}}})
--     bezier = standard, 0.2, 0, 0, 1
hl.curve("standard", { type = "bezier", points = { {0.2, 0}, {0, 1}}})

--     # Animation configs
--     animation = layersIn, 1, 5, emphasizedDecel, slide
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "emphasizedDecel", style = "slide"})
--     animation = layersOut, 1, 4, emphasizedAccel, slide
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "emphasizedAccel", style = "slide"})
--     animation = fadeLayers, 1, 5, standard
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "standard"})

--     animation = windowsIn, 1, 5, emphasizedDecel
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "emphasizedDecel"})
--     animation = windowsOut, 1, 3, emphasizedAccel
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "emphasizedAccel"})
--     animation = windowsMove, 1, 6, standard
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "standard"})
--     animation = workspaces, 1, 5, standard
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard"})

--     animation = specialWorkspace, 1, 4, specialWorkSwitch, slidefadevert 15%
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "specialWorkSwitch", style = "slidefadevert 15%"})

--     animation = fade, 1, 6, standard
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard"})
--     animation = fadeDim, 1, 6, standard
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard"})
--     animation = border, 1, 6, standard
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard"})

-- input
hl.config({
    input = {
        sensitivity = 0.3,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.3
        }
    }
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({fingers = 3, direction = "up", action = "special", workspace_name = "magic"})

-- keybinds
local mainMod = "SUPER"
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({action = "toggle"}))
-- hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("vivaldi"))

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))

-- move window with vimkeys
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ direction = "left"}))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ direction = "right"}))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ direction = "up"}))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ direction = "down"}))
-- move window focus with vimkeys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left"}))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up"}))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down"}))
-- move window to a workspace
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = "-1"}))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace = "+1"}))
-- move window to a workspace
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "-1"}))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "+1"}))

-- move/resize windows with dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- window rule
local special_window = {
    "discord",
    "vivaldi-cinhimbnkkaeohfgghhklpknlkffjgod-Default",
}

for _, class_name in ipairs(special_window) do
    hl.window_rule({
        match = {
            class = class_name,
        },
        workspace = "special:magic",
    })
end
hl.window_rule({
    name = "vscode no transparent",
    match = {
        class = "code",
    },
    opacity = "1 override",
})
hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
