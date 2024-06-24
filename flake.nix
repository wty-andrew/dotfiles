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
      # TODO: latest version freezes, using a customize version (v0.39.1 + cherry-pick fcitx fix) for now
      url = "git+file:///home/andrew/source/Hyprland";
      # url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hycov = {
      url = "github:DreamMaoMao/hycov/0.39.1.1";
      inputs.hyprland.follows = "hyprland";
    };

    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };

    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-stable, home-manager, emacs-overlay, ... }:
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
