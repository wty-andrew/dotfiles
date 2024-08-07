{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    imv
  ];

  xdg.mimeApps.defaultApplications =
    let
      mimeTypes = [
        "image/gif"
        "image/jpeg"
        "image/jpg"
        "image/png"
        "image/tiff"
        "image/svg+xml"
      ];
    in
    lib.genAttrs mimeTypes (_: [ "imv.desktop" ]);

  xdg.configFile."imv".source = ../../config/imv;
}
