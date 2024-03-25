{ pkgs, ... }: {
  home.packages = with pkgs; [
    minikube
    kubectl
    kubernetes-helm
    k9s
  ];

  home.file.".config/k9s/skins".source = ../../config/k9s/skins;
}
