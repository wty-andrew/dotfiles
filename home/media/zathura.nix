{ pkgs, ... }: {
  home.packages = with pkgs; [
    zathura
  ];

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
  };

  xdg.configFile."zathura".source = ../../config/zathura;
}
