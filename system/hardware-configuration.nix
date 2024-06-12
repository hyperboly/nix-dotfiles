# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, inputs, lib, pkgs, modulesPath, ... }:

{
    imports = [
        ./bluetooth/bluetooth.nix
        ./peripherals/nodebounce.nix
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ];

    boot.initrd.availableKernelModules = [ "amdgpu" "nvme" "xhci_pci" "thunderbolt" "usb_storage" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
    { device = "rpool/system/root";
        fsType = "zfs";
    };

    fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3483-D2EB";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
    };

    fileSystems."/nix" =
    { device = "rpool/local/nix";
        fsType = "zfs";
    };

    fileSystems."/var" =
    { device = "rpool/system/var";
        fsType = "zfs";
    };

    fileSystems."/home/hyperboly" =
    { device = "rpool/user/home/hyperboly";
        fsType = "zfs";
    };

    swapDevices = [ ];

# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
# (the default) this is the recommended approach. When using systemd-networkd it's
# still possible to use this option, but it's recommended to use it in conjunction
# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
# networking.interfaces.enp193s0f3u2u3.useDHCP = lib.mkDefault true;
# networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

# Mediatek driver fix for Framework.
    hardware.wirelessRegulatoryDatabase = true;
    boot.extraModprobeConfig = ''
        options cfg80211 ieee80211_regdom="US"
    '';

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
