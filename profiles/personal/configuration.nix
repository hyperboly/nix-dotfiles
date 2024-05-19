{ configs, lib, pkgs, systemSettings, userSettings, ... }:

{
    imports = [
        ../../system/hardware-configuration.nix
        ../../system/grub.nix
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
        wpa_supplicant
    ];

    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
    
    fonts.fontDir.enable = true;

    #xdg.portal = {
    #    enable = true;
    #    extraPortals = [
    #        pkgs.xdg-desktop-portal
    #        pkgs.xdg-desktop-portal-gtk
    #    ];
    #};

    system.stateVersion = "23.11";
}