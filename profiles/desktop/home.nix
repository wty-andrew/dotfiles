{ helpers, ... }: {
  imports = [
    ../base/home.nix

    ../../home/browser
    ../../home/capture
    ../../home/cloud
    ../../home/console
    ../../home/creative
    ../../home/database
    ../../home/devops
    ../../home/editor
    ../../home/embedded
    ../../home/game
    ../../home/gis
    ../../home/lang
    ../../home/media
    ../../home/messenger
    ../../home/organizer
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
        names = [ "nvidia" "variables" "frappe" "keybindings" "plugin" "startup" "desktop" ];
      in
      {
        source = builtins.map configPath names;
      };
  };
}
