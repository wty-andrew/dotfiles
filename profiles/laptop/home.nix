{ helpers, ... }: {
  imports = [
    ../base/home.nix

    ../../home/browser
    ../../home/capture
    ../../home/console
    ../../home/database
    ../../home/devops
    ../../home/editor
    ../../home/embedded
    ../../home/lang
    ../../home/media
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
        names = [ "nvidia" "variables" "frappe" "keybindings" "plugin" "startup" "laptop" ];
      in
      {
        source = builtins.map configPath names;
      };
  };
}
