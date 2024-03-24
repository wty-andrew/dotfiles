{ username, ... }: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.nix-index.enable = true;
}
