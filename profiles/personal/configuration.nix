{ configs, lib, pkgs, systemSettings, userSettings, ... }:

{
    imports = [
        ../../system/hardware-configuration.nix
        ../../system/boot/grub.nix
        ../../system/audio/audio.nix
        ../../system/kernel/zen.nix
        ../../system/zfs/zfs.nix
        (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
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
        power-profiles-daemon
        smartmontools
        #starship
        #sanoid
    ];

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.libinput.enable = true;

    fonts.fontDir.enable = true;

    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    #userSettings.theme.flavour = "mocha";
    #programs.starship = {
    #    enable = true;
    #    catppuccin.enable = true;
    #};

    services.smartd.enable = true;

    services.power-profiles-daemon.enable = true;

    system.stateVersion = "23.11";
}
