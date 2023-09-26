{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, emacs-overlay, ... }:
    let
      system = "x86_64-linux";
      hostname = "nixos";
      username = "andrew";

      unstable-overlay = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ unstable-overlay emacs-overlay.overlay ];
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
          ];
        };

      mkHome = profile:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs username helpers; };
          modules = [
            (./. + "/profiles/${profile}/home.nix")
          ];
        };
    in
    {
      nixosConfigurations = forAllProfiles mkNixos;

      homeConfigurations = forAllProfiles mkHome;
    };
}
