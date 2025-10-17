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
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git # required for flakes
    ntfs3g
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
        xorg.libX11 # libX11.so.6
        wayland
      ]
    );
  };
}
