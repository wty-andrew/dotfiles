{ pkgs, username, hostname, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git # required for flakes
  ];

  system.stateVersion = "23.11";

  nix.settings = {
    auto-optimise-store = true;

    experimental-features = [ "nix-command" "flakes" ];

    trusted-users = [ "root" "@wheel" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  programs.nix-ld.enable = true;
}
