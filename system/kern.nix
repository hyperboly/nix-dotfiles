{ configs, pkgs, ... }:

{
    boot.kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;
}
