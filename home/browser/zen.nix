{ lib, ... }: {
  # TODO: use https://github.com/NixOS/nixpkgs/issues/327982 instead of flatpak
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
    lib.genAttrs mimeTypes (_: [ "io.github.zen_browser.zen.desktop" ]);
}
