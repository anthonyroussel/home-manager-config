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

            imports = (import ../packages/module-list.nix) ++ [
              ../modules/git
              inputs.sops-nix.homeManagerModule
              inputs.stylix.homeModules.stylix
              ./home
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
