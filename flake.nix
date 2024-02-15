{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    ags.url = "github:Aylur/ags";
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    username = "andrew";
    hostname = "nixos";
    system = "x86_64-linux";
    profile = "desktop";

    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ overlay-unstable ];
    };

    helpers = {
      # taken from: https://github.com/nix-community/home-manager/issues/257
      runtimePath = path: "/home/${username}/dotfiles" + nixpkgs.lib.removePrefix (toString self) (toString path);
    };
  in
  {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit username hostname system; };
	      modules = [
          (./. + "/profiles/${profile}/configuration.nix")
        ];
      };
    };

    homeConfigurations = {
      "${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs username helpers; };
        modules = [
          (./. + "/profiles/${profile}/home.nix")
        ];
      };
    };
  };
}
