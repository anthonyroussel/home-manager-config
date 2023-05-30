{
  description = "Home Manager configuration of Anthony Roussel";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv = {
      url = "github:cachix/devenv/latest";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = { nixpkgs, home-manager, nur, devenv, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.aroussel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nur.hmModules.nur
          ./home.nix
        ];
        extraSpecialArgs = { inherit nur devenv; };
      };
    };
}
