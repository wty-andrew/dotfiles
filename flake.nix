{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
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

    waveforms = {
      url = "github:liff/waveforms-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hermes-agent = {
      url = "github:NousResearch/hermes-agent";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://noctalia.cachix.org"
      "https://cache.numtide.com"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
    ];
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-stable, home-manager, emacs-overlay, catppuccin, sops-nix, noctalia, waveforms, hermes-agent, llm-agents, ... }:
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
        overlays = [
          stable-overlay
          emacs-overlay.overlay
          llm-agents.overlays.shared-nixpkgs
        ];
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
            hermes-agent.nixosModules.default
            # waveforms.nixosModule
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
            noctalia.homeModules.default
          ];
        };
    in
    {
      nixosConfigurations = forAllProfiles mkNixos;

      homeConfigurations = forAllProfiles mkHome;
    };
}
