{ config, pkgs, inputs, userSettings, ... }:

{
    imports = [
        inputs.impermanence.nixosModules.impermanence
    ];

    environment.persistence."/persist" = {
        enable = true;  # NB: Defaults to true, not needed
        hideMounts = true;
        directories = [
            "/var/log"
            "/var/lib/bluetooth"
            "/var/lib/nixos"
            "/var/lib/systemd/coredump"
            "/var/lib/syncoid"
            "/var/lib/fprint"
            "/var/lib/NetworkManager"
            "/var/lib/tailscale"
            "/var/lib/libvirt"
            "/etc/NetworkManager"
        ];

        files = [
            "/etc/machine-id"
            #{ file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
        ];

        users.${userSettings.username} = {
            directories = [
                "Downloads"
                "Music"
                "Pictures"
                "Documents"
                "Videos"
                "Public"
                "Programming"
                "Templates"
                "keepass"
                "Games"
                ".mozilla"
                ".thunderbird"
                ".tmux-layouts"
                ".dotfiles"
                ".config/syncthing"
                ".config/Signal"
                ".config/vesktop"
                ".config/fcitx5"
                ".config/obs-studio"
                ".local/share/nvim"
                ".local/share/Steam"
                ".local/share/PrismLauncher"
                ".local/share/lutris"
                ".local/state/nvim"
                ".local/state/wireplumber"
                { directory = ".gnupg"; mode = "0700"; }
                { directory = ".ssh"; mode = "0700"; }
                { directory = ".local/share/keyrings"; mode = "0700"; }
                 #".local/share/direnv"
            ];
        };
    };
}
