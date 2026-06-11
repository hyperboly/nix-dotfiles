{ config, lib, pkgs, systemSettings, ... }:

{
  systemd.network = {
    enable = true;
    wait-online.enable = false;

    links = {
      "10-wifi" = {
        matchConfig.MACAddress = "10:5f:ad:d8:4c:ad";
        linkConfig = {
          Name = "wlp2s0";
          MACAddressPolicy = "random";
        };
      };
    };

    networks = {
      "20-br-lab" = {
        matchConfig.Name = "br-lab";
        networkConfig.LinkLocalAddressing = "no";
      };

      "20-br-dmz" = {
        matchConfig.Name = "br-dmz";
        networkConfig.LinkLocalAddressing = "no";
      };

      "99-unmanaged" = {
        matchConfig.Name = "veth* docker* podman* virbr* vnet* tailscale* netbird*";
        linkConfig.Unmanaged = "yes";
      };
    };

    netdevs = {
      "20-br-lab" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "br-lab";
        };
      };

      "20-br-dmz" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "br-dmz";
        };
      };
    };
  };

  networking = {
    useNetworkd = true;
    useDHCP = false;
    usePredictableInterfaceNames = true;
    hostName = systemSettings.hostname;
    hostId = "eb3b649e";

    networkmanager = {
      enable = true;
      unmanaged = [
        "br-lab"
        "br-dmz"
        "interface-name:veth*"
        "interface-name:podman*"
        "interface-name:virbr*"
        "interface-name:vnet*"
        "interface-name:tailscale*"
        "interface-name:netbird*"
      ];
      wifi.macAddress = "preserve";
    };

    firewall = {
        enable = true;
        allowedTCPPorts = [ 53317 ];
        allowedUDPPorts = [ 53317 51820 41641 33073 ];
        allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
        allowedUDPPortRanges = [{ from = 1714; to = 1764; }];
        checkReversePath = "loose";
        trustedInterfaces = [ "netbird-wt0" ];
      };
  };
}
