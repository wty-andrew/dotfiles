{ pkgs, ... }: {
  home.packages = with pkgs; [
    zathura
  ];

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
  };

  home.file.".config/zathura".source = ../../config/zathura;
}
