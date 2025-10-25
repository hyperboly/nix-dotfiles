{ config, lib, pkgs, systemSettings, ... }:

{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
    nameservers = [ "100.100.100.100" ];
    firewall = rec {
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
    hostId = "eb3b649e";

    # Bridging
    # interfaces.br0.useDHCP = true;
    # bridges = {
    #   "br0" = {
    #     interfaces = [ "wlp2s0" ];
    #   };
    # };
  };
}
