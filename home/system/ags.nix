{ inputs, config, pkgs, helpers, ... }:
let
  agsPackages = with inputs.ags.packages.${pkgs.system}; [
    apps
    battery
    bluetooth
    hyprland
    mpris
    network
    notifd
    tray
    wireplumber
  ];
in
{
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs; [
    inputs.ags.packages.${system}.io # astal cli
    sassc
  ] ++ agsPackages;

  programs.ags = {
    enable = true;

    # TODO: ExecStart should be "ags run" ?
    # systemd.enable = true;

    extraPackages = with pkgs; [
      libsoup_3
    ] ++ agsPackages;
  };

  xdg.configFile."ags".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/ags);
}
