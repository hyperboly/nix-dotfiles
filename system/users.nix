{ config, lib, pkgs, userSettings, ... }:

{
    users.users.root.hashedPasswordFile = "/persist/etc/shadow/root";

    users.users.${userSettings.username} = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "networkmanager"
            "adbusers"
        ];
        uid = 1000;
        description = userSettings.name;
        packages = [];
        hashedPasswordFile = "/persist/etc/shadow/"+userSettings.name;
    };
}
