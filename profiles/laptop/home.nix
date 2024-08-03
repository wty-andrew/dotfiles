{ helpers, ... }: {
  imports = [
    ../base/home.nix

    ../../home/browser
    ../../home/capture
    ../../home/creative
    ../../home/console
    ../../home/devops
    ../../home/editor
    ../../home/lang
    ../../home/media/imv.nix
    ../../home/media/mpris.nix
    ../../home/media/spotify.nix
    ../../home/media/vlc.nix
    ../../home/media/zathura.nix
    ../../home/security
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
        names = [ "nvidia" "variables" "frappe" "keybindings" "plugin" "startup" "laptop" ];
      in
      {
        source = builtins.map configPath names;
      };
  };
}
