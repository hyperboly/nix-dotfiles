{ config, pkgs, ... }:

{
  #boot.kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;
  #boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
