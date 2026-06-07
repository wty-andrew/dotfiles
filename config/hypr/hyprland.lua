require("general")
require("keybinds")
require("rules")

local profile = io.popen("hostnamectl chassis"):read("*l")
if profile == "desktop" then
    require("desktop")
elseif profile == "laptop" then
    require("laptop")
end

-- Startup
hl.on("hyprland.start", function()
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("hyprctl setcursor Qogir 24")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("dropbox start")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("systemctl enable --user app-com.mitchellh.ghostty.service")
end)

-- Environment Variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Qogir")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("SPICE_NOGRAB", "1")
