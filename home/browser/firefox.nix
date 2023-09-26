{ lib, ... }: {
  programs.firefox.enable = true;

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
    lib.genAttrs mimeTypes (_: [ "firefox.desktop" ]);
}
