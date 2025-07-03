{
  description = "sheikhevan's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    apple-silicon,
    home-manager,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations."hydrogen" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/hydrogen/configuration.nix
        apple-silicon.nixosModules.apple-silicon-support
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.backupFileExtension = "bak";

          home-manager.users.evan = import ./hosts/hydrogen/home.nix;

          home-manager.extraSpecialArgs = {inherit inputs;};
        }
        nvf.nixosModules.default
      ];
    };
  };
}
