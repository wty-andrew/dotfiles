{ ... }: {
  imports = [
    # ./blender.nix # TODO: takes too long to build, using flatpak for now
    ./kodelife.nix
    ./krita.nix
    ./pureref.nix
  ];
}
