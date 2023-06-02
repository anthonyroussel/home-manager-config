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
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeManagerModules.aroussel = {
        inherit (pkgs);
        imports = [
          nur.hmModules.nur
          ./home.nix
        ];
      };

      homeConfigurations.aroussel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          self.homeManagerModules.aroussel
          {
            home.username = "aroussel";
            home.homeDirectory = "/home/aroussel";
          }
        ];
      };
    };
}
