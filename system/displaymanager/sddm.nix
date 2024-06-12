{ config, ... }:

{
    services.xserver.enable = true;
    services = {
        displayManager.sddm = {
            enable = true;
            theme = "chili";
        };
    };

}
