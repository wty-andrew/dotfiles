{ inputs, config, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # configDir = ./config/ags;

    extraPackages = with pkgs; [
      libsoup_3
    ];
  };

  home.file.".config/ags".source = config.lib.file.mkOutOfStoreSymlink "/home/andrew/dotfiles/home-manager/config/ags";
}
