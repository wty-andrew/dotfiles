{ inputs, config, pkgs, helpers, ... }:
let
  agsPackages = with inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}; [
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
    inputs.ags.packages.${pkgs.stdenv.hostPlatform.system}.io # astal cli
    sassc
    mako # TODO: remove once implemented in ags
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
  xdg.configFile."mako".source = ../../config/mako;
}
