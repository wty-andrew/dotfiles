{ ... }: {
  imports = [
    ./fluxcd.nix
    ./gcloud.nix
    ./kubernetes.nix
    ./pulumi.nix
    ./terraform.nix
  ];
}
