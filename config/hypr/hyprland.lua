
-- Monitors
hl.monitor({
    output      = "HDMI-A-1",
    mode        = "2560x1440",
    position    = "0x0",
    scale       = "1"
})

hl.monitor({
    output      = "DP-1",
    mode        = "1920x1440",
    position    = "2560x-200",
    scale       = "1",
    transform   = 1
})

-- Define wallpapers
-- TODO: define these in a list, and make them dependent on the monitors above
local wpr1  = "swaybg -o HDMI-A-1 -i /home/$USER/Pictures/wallpapers/greenai.jpg"
local wpr2  = "swaybg -o DP-1 -c 121212"

-- Wallpapers and bars
hl.on("hyprland.start", function () 
    hl.exec_cmd("waybar")
    hl.exec_cmd(wpr1)
    hl.exec_cmd(wpr2) 
end)

-- Programs
local terminal      = "kitty"
local fileManager   = "pcmanfm"
local menu          = "wofi -G --show drun"
local browser       = "brave"
local passMgr       = "1password"
local notes         = "obsidian"
local screenshot    = "grim -g \"$(slurp -d)\" - | wl-copy"

-- Env Var
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true  -- If true disables the random hyprland logo / anime girl background. :(
    },
})

-- Main config
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 3,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 4,
        rounding_power = 4,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.95,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 7,
            vibrancy  = 0.05,
        },
    },

    animations = {
        enabled = false,
    },
})

-- Key bindings
local mainMod = "SUPER"

-- Workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Control windows
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Example window rules that are useful
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    -- suppressMaximizeRule:set_enabled(false)
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
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

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

-- Screenshots
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot))

-- Move focus
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

-- Specific programs
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(passMgr))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))


