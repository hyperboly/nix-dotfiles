# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./system/hardware-configuration.nix
        ];

# Use the systemd-boot EFI boot loader.
# boot.loader.systemd-boot.enable = true;

    boot.supportedFilesystems = [ "zfs" ];
    networking.hostId = "eb3b649e";
    boot.loader.grub = {
        enable = true;
        zfsSupport = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
        enableCryptodisk = true;
    };

    boot.initrd.luks.devices = {
        root = {
            device = "/dev/disk/by-uuid/76d3da1e-e86e-4025-b00a-2b8a8cc0f682";
            preLVM = true;
        };
    };

# Enable Flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking.hostName = "nixon"; # Define your hostname.
# Pick only one of the below networking options.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
        networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

# Set your time zone.
        time.timeZone = "Asia/Taipei";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
# console = {
#   font = "Lat2-Terminus16";
#   keyMap = "us";
#   useXkbConfig = true; # use xkb.options in tty.
# };

# Enable the X11 windowing system.
    services.xserver.enable = true;


# Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

# Automatically scrub ZFS pools
    services.zfs.autoScrub.enable = true;

# Configure keymap in X11
# services.xserver.xkb.layout = "us";
# services.xserver.xkb.options = "eurosign:e,caps:escape";

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
    sound.enable = false;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

# Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.hyperboly = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
            #packages = with pkgs; [
            #    firefox
            #    neovim
            #    tree
            #    steam
            #    discord
            #    foot
            #    syncthing
            #    keepassxc
            #];
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim 
        wget
        nvtop
        btop
        iperf
        git
        home-manager
    ];

    system.copySystemConfiguration = false;
    system.stateVersion = "23.11"; 
}

