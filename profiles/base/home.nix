{ username, ... }: rec {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.sessionPath = [
    "${home.homeDirectory}/.local/bin"
  ];

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.nix-index.enable = true;
}
