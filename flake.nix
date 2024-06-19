{
    description = "Hyper Flake";

    inputs = {
        #nixpkgs.url = "nixpkgs/nixos-23.11";
        nixpkgs.url = "nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

        #home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # Hyprland repo
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        stylix.url = "github:danth/stylix/master";
        #stylix.url = "github:danth/stylix/release-24.05";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    };

    outputs = inputs@{ self, ... }:
    let
        systemSettings = {
            system = "x86_64-linux";
            hostname = "nixon";
            profile = "personal";
            timezone = "Asia/Taipei";
            locale = "en_US.UTF-8";
        };

        userSettings = rec {
            username = "hyperboly";
            name = "hyperboly";
            email = "johnwuonmail@gmail.com";
            dotfilesDir = "~/.dotfiles";
            wm = "hyprland";
            browser = "firefox";
            term = "foot";
            font = "monocraft";
            editor = "nvim";
            shell = "zsh";
        };

        lib = inputs.nixpkgs.lib;
        pkgs = import inputs.nixpkgs {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };

        pkgs-unstable = import inputs.nixpkgs-unstable {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };

        home-manager = inputs.home-manager;


        supportedSystems = [ "aarch64-linux" "x86_64-linux" ];

    in
    {
        nixosConfigurations = {
            nixon = lib.nixosSystem {
                system = systemSettings.system;
                modules = [
                    (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
                ];
                specialArgs = {
                    inherit pkgs;
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };

        homeConfigurations = {
            hyperboly = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                    (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
                ];
                extraSpecialArgs = {
                    inherit pkgs-unstable;
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                };
            };
        };
    };
}
