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

    hycov = {
      url = "github:DreamMaoMao/hycov";
      inputs.hyprland.follows = "hyprland";
    };

    ags.url = "github:Aylur/ags";

    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, emacs-overlay, ... }:
    let
      username = "andrew";
      hostname = "nixos";
      system = "x86_64-linux";
      profile = "desktop";

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
    in
    {
      nixosConfigurations = {
        ${hostname} = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username hostname system; };
          modules = [
            (./. + "/profiles/${profile}/configuration.nix")
          ];
        };
      };

      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs username helpers; };
          modules = [
            (./. + "/profiles/${profile}/home.nix")
          ];
        };
      };
    };
}
