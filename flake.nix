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
    nixpkgs-review-checks = {
      url = "github:SuperSandro2000/nixpkgs-review-checks";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeManagerModules.aroussel = {
        inherit (pkgs);
        imports = [
          nur.hmModules.nur
          ./modules/awscli.nix
          ./home.nix
        ];
      };

      homeConfigurations.aroussel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          self.homeManagerModules.aroussel
          {
            nixpkgs.overlays = [
              (
                final: prev: {
                  nixpkgs-review-checks = inputs.nixpkgs-review-checks.packages."${system}".nixpkgs-review-checks;
                }
              )
            ];
            home.username = "aroussel";
            home.homeDirectory = "/home/aroussel";
          }
        ];
      };
    };
}
