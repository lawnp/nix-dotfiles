{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
  { self, nixpkgs, ... }@inputs:
  let
    mkHost = host: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./modules/common.nix ./hosts/${host} ];
    };
  in {
      nixosConfigurations = {
        work = mkHost "work";
        home = mkHost "home";
      };
  };
}
