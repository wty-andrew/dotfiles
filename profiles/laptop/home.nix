{ helpers, ... }: {
  imports = [
    ../base/home.nix

    ../../home/browser
    ../../home/capture
    ../../home/creative
    ../../home/console
    ../../home/editor
    ../../home/lang
    ../../home/media/imv.nix
    ../../home/media/mpris.nix
    ../../home/media/spotify.nix
    ../../home/media/vlc.nix
    ../../home/media/zathura.nix
    ../../home/system
    ../../home/terminal
    ../../home/tools
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  wayland.windowManager.hyprland = {
    settings =
      let
        configPath = name: helpers.runtimePath (../../config/hypr + "/${name}.conf");
        names = [ "nvidia" "variables" "frappe" "keybindings" "plugin" "startup" ];
      in
      {
        source = builtins.map configPath names;
      };

    extraConfig = ''
      bind = $mainMod, B, exec, nvidia-offload firefox
    '';
  };
}
