{ config, lib, ... }:

{
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    services.blueman.enable = true;
}
