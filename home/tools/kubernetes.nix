{ pkgs, ... }: {
  home.packages = with pkgs.unstable; [
    kubectl
    kubernetes-helm
    k9s
  ];
}
