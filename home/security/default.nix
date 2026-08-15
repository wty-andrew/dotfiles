{ ... }: {
  imports = [
    ./age.nix
    ./gpg.nix
    ./mkcert.nix
    ./sops.nix
    ./tailscale.nix
  ];
}
