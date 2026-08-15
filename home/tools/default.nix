{ ... }: {
  imports = [
    ./appimage.nix
    ./baobab.nix
    ./bruno.nix
    ./disk.nix
    ./editorconfig.nix
    ./filezilla.nix
    ./foxglove.nix
    ./git.nix
    ./grsync.nix
    ./meshlab.nix
    ./motrix.nix
    ./networking.nix
    ./ouch.nix
    ./presenterm.nix
    # ./realvnc.nix # TODO: remove? (https://github.com/NixOS/nixpkgs/issues/534133)
    ./snapshot.nix
    # ./wasmedge.nix # broken
    ./zenoh.nix
  ];
}
