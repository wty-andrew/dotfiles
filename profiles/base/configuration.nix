{ options, pkgs, username, hostname, ... }: {
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
    extraGroups = [ "networkmanager" "wheel" "dialout" "plugdev" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git # required for flakes
    ntfs3g
    btrfs-progs
  ];

  system.stateVersion = "23.11";

  nix.settings = {
    auto-optimise-store = true;

    experimental-features = [ "nix-command" "flakes" ];

    trusted-users = [ "root" "@wheel" ];

    substituters = [
      "https://cache.nixos.org"
      "https://cache.nixos-cuda.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  programs.nix-ld = {
    enable = true;
    # from: https://discourse.nixos.org/t/pyhton-use-pyqt6-within-an-virtual-environment-venv/66494
    libraries = options.programs.nix-ld.libraries.default ++ (
      with pkgs; [
        dbus # libdbus-1.so.3
        fontconfig # libfontconfig.so.1
        freetype # libfreetype.so.6
        glib # libglib-2.0.so.0
        libGL # libGL.so.1
        libxkbcommon # libxkbcommon.so.0
        libx11 # libX11.so.6
        wayland
      ]
    );
  };
}
