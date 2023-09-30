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
      url = "github:anthonyroussel/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv = {
      url = "github:cachix/devenv?ref=v0.6.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [
        (
          final: prev: {
            devenv = inputs.devenv.packages."${system}".devenv;
            nixpkgs-review-checks = inputs.nixpkgs-review-checks.packages."${system}".nixpkgs-review-checks;
            shadow-prod = nur.packages."${system}".shadow-prod;
          }
        )
        inputs.nix-vscode-extensions.overlays.default
      ];

    in {
      inherit overlays;

      homeManagerModules.aroussel = {
        inherit (pkgs);
        imports = [
          stylix.homeManagerModules.stylix
          ./home.nix
        ];
        nixpkgs.overlays = overlays;
      };

      homeConfigurations.aroussel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          self.homeManagerModules.aroussel
          {
            nixpkgs.overlays = overlays;
            home.username = "aroussel";
            home.homeDirectory = "/home/aroussel";
          }
        ];
      };
    };
}
