{ ... }: {
  imports = [
    ./appimage.nix
    ./baobab.nix
    ./bruno.nix
    ./caddy.nix
    ./editorconfig.nix
    ./filezilla.nix
    ./foxglove.nix
    ./git.nix
    ./grsync.nix
    ./meshlab.nix
    ./mkcert.nix
    ./motrix.nix
    ./ouch.nix
    ./presenterm.nix
    # ./realvnc.nix # TODO: remove? (https://github.com/NixOS/nixpkgs/issues/534133)
    ./snapshot.nix
    ./wasmedge.nix
    ./wifi-hotspot.nix
    ./zenoh.nix
  ];
}
