{
  description = "rafezuxoo's flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager-stable = {
      url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz"; # HM stable (24.11)
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    home-manager-unstable = {
      url = "https://github.com/nix-community/home-manager/archive/master.tar.gz"; # HM unstable
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs-stable, home-manager-stable, ... }@inputs: 
  let
      system = "x86_64-linux";
  in {
      nixosConfigurations.nixos-home = nixpkgs-stable.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./nixos/configuration.nix ];
      };
      
      homeConfigurations.raf = home-manager-stable.lib.homeManagerConfiguration {
          pkgs = nixpkgs-stable.legacyPackages."${system}";
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home-manager/home.nix ];
      };
  };
}
