{ configs, lib, pkgs, systemSettings, userSettings, ... }:

{
    imports = [
        ../../system/hardware-configuration.nix
        ../../system/grub.nix
        ../../system/audio.nix
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking.hostName = systemSettings.hostname;
    networking.networkmanager.enable = true;

    time.timeZone = systemSettings.timezone;

    i18n.defaultLocale = systemSettings.locale;
    i18n.extraLocaleSettings = {
        LC_ADDRESS = systemSettings.locale;
        LC_IDENTIFICATION = systemSettings.locale;
        LC_MEASUREMENT = systemSettings.locale;
        LC_MONETARY = systemSettings.locale;
        LC_NAME = systemSettings.locale;
        LC_NUMERIC = systemSettings.locale;
        LC_PAPER = systemSettings.locale;
        LC_TELEPHONE = systemSettings.locale;
        LC_TIME = systemSettings.locale;
    };

    users.users.${userSettings.username} = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "networkmanager"
        ];
        uid = 1000;
        description = userSettings.name;
        packages = [];
    };

    # System package
    environment.systemPackages = with pkgs; [
        wget
        curl
        zsh
        git
        home-manager
        cryptsetup
        nvtop
        btop
    ];
    
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.libinput.enable = true;

    fonts.fontDir.enable = true;

    services.zfs.autoScrub.enable = true;

    system.stateVersion = "23.11";
}
