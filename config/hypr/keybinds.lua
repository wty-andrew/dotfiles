-- Apps
hl.bind("SUPER + ESCAPE", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd("emacsclient -c -a emacs"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("ghostty +new-window"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("code --enable-wayland-ime --use-angle=none"))

-- Layout
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + Slash", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float()) -- dwindle only

-- Window / Workspace
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + BRACKETLEFT", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + BRACKETRIGHT", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + SHIFT + BRACKETLEFT", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + SHIFT + BRACKETRIGHT", hl.dsp.window.move({ workspace = "+1" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + SPACE", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:magic" }))

-- Noctalia
hl.bind("ALT + Tab", hl.dsp.exec_cmd("noctalia msg window-switcher"))
hl.bind("SUPER + Comma", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind("SUPER + Semicolon", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

-- Screenshot
hl.bind("SUPER + S", hl.dsp.exec_cmd("grimblast --notify copysave output"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("grimblast --notify copysave active"))
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("grimblast --notify copysave screen"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimblast --notify copysave area"))

-- Mouse
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("ALT + XF86AudioNext", hl.dsp.exec_cmd("playerctl shift"), { locked = true })
hl.bind("ALT + XF86AudioPrev", hl.dsp.exec_cmd("playerctl unshift"), { locked = true })
