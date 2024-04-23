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
            home.username = "aroussel";
            home.homeDirectory = "/home/aroussel";
          }
        ];
      };
    };
}
