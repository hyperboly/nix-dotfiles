{
    description = "Hyper Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        home-manager-unstable.url = "github:nix-community/home-manager/master";
        home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";

        # Hyprland repo
        hyprland.url = "github:hyprwm/Hyprland";
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
