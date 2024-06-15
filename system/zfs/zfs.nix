{configs, pkgs, ...}:

{
    services.zfs.autoScrub.enable = true;
    services.zfs.trim.enable = true;
    services.sanoid = {
        enable = true;
        datasets = {
            "rpool/system/var" = {
                hourly = 50;
                daily = 15;
                weekly = 3;
                monthly = 1;
            };
            "rpool/user/home/hyperboly" = {
                hourly = 50;
                daily = 15;
                weekly = 3;
                monthly = 1;
            };
        };
    };
}
