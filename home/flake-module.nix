{ self, inputs, ... }:

{
  perSystem =
    {
      config,
      pkgs,
      lib,
      system,
      ...
    }:
    {
      legacyPackages.homeConfigurations.aroussel = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            _module.args.self = self;
            _module.args.inputs = self.inputs;

            imports = [
              inputs.sops-nix.homeManagerModule
              inputs.stylix.homeManagerModules.stylix
              ./home.nix
            ];
          }
          {
            nixpkgs.overlays = [
              (final: prev: { shadow-prod = inputs.nur.packages."${system}".shadow-prod; })
              inputs.nix-vscode-extensions.overlays.default
            ];
            home.username = "aroussel";
            home.homeDirectory = "/home/aroussel";
          }
        ];
      };
    };
}
