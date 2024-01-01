{ inputs, config, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs; [
    sassc
  ];

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      libsoup_3
    ];

    # configDir = ../../config/ags;
  };

  home.file.".config/ags".source = config.lib.file.mkOutOfStoreSymlink "/home/andrew/dotfiles/config/ags";
}
