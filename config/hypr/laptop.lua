hl.monitor({
    output   = "eDP-1",
    mode     = "highres",
    position = "0x0",
    scale    = 1.6,
})

hl.monitor({
    output    = "HDMI-A-2",
    mode      = "highres",
    position  = "auto",
    scale     = 1,
})

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-2", persistent = true })

hl.bind("SUPER + B", hl.dsp.exec_cmd("nvidia-offload firefox-nightly"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("nvidia-offload chromium-browser"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("nvidia-offload zen"))
