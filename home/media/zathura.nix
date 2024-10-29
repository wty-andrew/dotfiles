{ pkgs, ... }: {
  home.packages = with pkgs; [
    zathura
  ];

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };

  xdg.configFile."zathura".source = ../../config/zathura;
}
