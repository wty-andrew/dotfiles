{ helpers, ... }: {
  imports = [
    ../base/home.nix

    ../../home/browser
    ../../home/capture
    ../../home/cloud
    ../../home/console
    ../../home/creative
    ../../home/editor
    ../../home/game
    ../../home/lang
    ../../home/media
    ../../home/organizer
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
