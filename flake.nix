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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-secrets = {
      url = "github:anthonyroussel/nix-secrets";
      flake = false;
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-secrets,
      nur,
      sops-nix,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [
        (final: prev: {
          nixpkgs-review-checks = inputs.nixpkgs-review-checks.packages."${system}".nixpkgs-review-checks;
          shadow-prod = inputs.nur.packages."${system}".shadow-prod;
        })
        inputs.nix-vscode-extensions.overlays.default
      ];
      nixosModules = import ./modules;
    in
    {
      inherit overlays nixosModules;

      homeManagerModules.aroussel = {
        inherit (pkgs);
        imports = [
          sops-nix.homeManagerModule
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

        extraSpecialArgs = {
          inherit nix-secrets;
        };
      };
    };
}
