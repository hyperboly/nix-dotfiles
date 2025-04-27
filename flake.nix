{
  description = "Hyper Flake";

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
        dotfiles_dir = "/home/hyperboly/.dotfiles";
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
            #(./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            ./profiles/${systemSettings.profile}/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                extraSpecialArgs = {
                  inherit pkgs-unstable;
                  inherit systemSettings;
                  inherit userSettings;
                  inherit inputs;
                };

                users.${userSettings.username} = {
                  #imports = [ (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") ];
                  imports = [ ./profiles/${systemSettings.profile}/home.nix ];
                };
              };
            }
          ];
          specialArgs = {
            inherit pkgs;
            inherit pkgs-unstable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
    };

  inputs = {
    #nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    #home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # impermanence repo
    impermanence.url = "github:nix-community/impermanence";

    # niri repo
    niri.url = "github:sodiboo/niri-flake";

    stylix.url = "github:danth/stylix/release-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
}
