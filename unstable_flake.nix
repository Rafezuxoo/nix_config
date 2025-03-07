{
  description = "rafezuxoo's flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "https://github.com/nix-community/home-manager/archive/master.tar.gz"; # HM unstable
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
      system = "x86_64-linux";
  in {
      nixosConfigurations.nixos-home = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./nixos/configuration.nix ];
      };
      
      homeConfigurations.raf = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."${system}";
          modules = [ ./home-manager/home.nix ];
      };
  };
}
