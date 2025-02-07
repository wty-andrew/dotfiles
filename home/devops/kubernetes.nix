{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    minikube
    krew
    kubectl
    kubernetes-helm
  ];

  programs.k9s.enable = true;

  xdg.configFile =
    let
      themeFile = "catppuccin-frappe-transparent.yaml";
    in
    {
      "k9s/skins/${themeFile}".source = config.catppuccin.sources.k9s + "/${themeFile}";
    };

  home.sessionPath = [
    "${config.home.homeDirectory}/.krew/bin"
  ];
}
