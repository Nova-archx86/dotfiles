{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      dt-polonium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/polonium/configuration.nix ];
      };
      
      lt-caesium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/caesium/configuration.nix ];
      };
    };
  };
}
