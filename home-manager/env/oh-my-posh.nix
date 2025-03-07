{ config, pkgs, inputs, ... }:

let
  # Используем нестабильный канал для oh-my-posh
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
    programs.oh-my-posh = {
        enable = true;
        package = unstable.oh-my-posh;
        enableFishIntegration = true;
        useTheme = "tokyo";
#atomic tokyo
        #settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./tokyo-minimal.omp.json));
    };
}
