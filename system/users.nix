{ config, lib, pkgs, userSettings, ... }:

{
  users.users.root.hashedPasswordFile = "/persist/etc/shadow/root";

  users.users.${userSettings.username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "systemd-journal"
      "adbusers"
      "libvirtd"
      "audio"
      "realtime"
      "netbird-wt0"
    ];
    uid = 1000;
    description = userSettings.name;
    packages = [];
    hashedPasswordFile = "/persist/etc/shadow/"+userSettings.name;
  };
}
