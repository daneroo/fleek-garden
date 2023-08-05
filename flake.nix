{
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  description = "Fleek Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Fleek
    fleek.url = "github:ublue-os/fleek";

    # Overlays
    

  };

  outputs = { self, nixpkgs, home-manager, fleek, ... }@inputs: {

    # Available through 'home-manager --flake .#your-username@your-hostname'
    
    homeConfigurations = {
    
      "daniel@ubunix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [
          ./home.nix 
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./ubunix/daniel.nix
          ./ubunix/custom.nix
          # self-manage fleek
          ({
           nixpkgs.overlays = [];
          })

        ];
      };
      
      "daniel@ubunixarm" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [
          ./home.nix 
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./ubunixarm/daniel.nix
          ./ubunixarm/custom.nix
          # self-manage fleek
          ({
           nixpkgs.overlays = [];
          })

        ];
      };
      
      "daniel@macnix.local" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [
          ./home.nix 
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./macnix.local/daniel.nix
          ./macnix.local/custom.nix
          # self-manage fleek
          ({
           nixpkgs.overlays = [];
          })

        ];
      };
      
    };
  };
}
