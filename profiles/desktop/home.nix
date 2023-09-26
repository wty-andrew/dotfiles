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
        names = [ "nvidia" "variables" "frappe" "keybindings" "plugin" "startup" ];
      in
      {
        source = builtins.map configPath names;
      };

    extraConfig = ''
      bind = $mainMod, B, exec, firefox

      bind = $mainMod, S, exec, grimblast --notify copysave output
      bind = $mainMod CTRL, S, exec, grimblast --notify copysave active
      bind = $mainMod ALT, S, exec, grimblast --notify copysave screen
      bind = $mainMod SHIFT, S, exec, grimblast --notify copysave area
    '';
  };
}
