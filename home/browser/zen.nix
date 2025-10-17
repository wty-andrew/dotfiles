{ inputs, pkgs, lib, ... }: {
  # TODO: check https://github.com/NixOS/nixpkgs/issues/327982
  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.mimeApps.defaultApplications =
    let
      mimeTypes = [
        "text/html"
        "text/xml"
        "application/xml"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/about"
        "x-scheme-handler/unknown"
      ];
    in
    lib.genAttrs mimeTypes (_: [ "zen.desktop" ]);
}
