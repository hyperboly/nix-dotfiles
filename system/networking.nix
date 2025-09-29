{ config, lib, pkgs, ... }:

{
  networking.hostName = systemSettings.hostname;
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
  networking.nameservers = [ "100.100.100.100" ];
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
  networking.hostId = "eb3b649e";
}
