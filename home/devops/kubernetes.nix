{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    minikube
    krew
    kubectl
    kubernetes-helm
    # (lib.lowPrio k3s) # lowPrio to prevent kubectl conflict
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
