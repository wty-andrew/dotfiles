{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "https://github.com/hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
      type = "git";
      submodules = true;
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags/v2.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };

    catppuccin.url = "github:catppuccin/nix";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-stable, home-manager, emacs-overlay, catppuccin, sops-nix, ... }:
    let
      system = "x86_64-linux";
      hostname = "nixos";
      username = "andrew";

      stable-overlay = final: prev: {
        stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ stable-overlay emacs-overlay.overlay ];
      };

      helpers = {
        # taken from: https://github.com/nix-community/home-manager/issues/257
        runtimePath = path: "/home/${username}/dotfiles" + nixpkgs.lib.removePrefix (toString self) (toString path);

        # taken from: https://www.reddit.com/r/NixOS/comments/scf0ui/how_would_i_update_desktop_file/
        patchDesktopEntry = pkg: appName: from: to: nixpkgs.lib.hiPrio (
          pkgs.runCommand "patched-desktop-entry-for-${appName}" { } ''
            ${pkgs.coreutils}/bin/mkdir -p $out/share/applications
            ${pkgs.gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
          ''
        );
      };

      forAllProfiles = nixpkgs.lib.genAttrs [ "desktop" "laptop" "wsl" ];

      mkNixos = profile:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username hostname system; };
          modules = [
            (./. + "/profiles/${profile}/configuration.nix")
            sops-nix.nixosModules.sops
          ];
        };

      mkHome = profile:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs username helpers; };
          modules = [
            (./. + "/profiles/${profile}/home.nix")
            catppuccin.homeModules.catppuccin
            sops-nix.homeManagerModules.sops
          ];
        };
    in
    {
      nixosConfigurations = forAllProfiles mkNixos;

      homeConfigurations = forAllProfiles mkHome;
    };
}
