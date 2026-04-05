{ ... }: {
  imports = [
    # ./blender.nix # TODO: takes too long to build, using flatpak for now
    ./krita.nix
    ./pureref.nix
  ];
}
