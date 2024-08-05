{config, lib, pkgs, ...}:

{
    imports = [ ./hardware-configuration.nix ];

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
}
