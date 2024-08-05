{ configs, lib, pkgs, ... }:

{
    services.zfs.autoScrub.enable = true;
    services.zfs.trim.enable = true;
    services.sanoid = {
        enable = true;
        datasets = {
            #"rpool/system/var" = {
            #    hourly = 50;
            #    daily = 15;
            #    weekly = 3;
            #    monthly = 1;
            #};
            #"rpool/user/home/hyperboly" = {
            #    hourly = 50;
            #    daily = 15;
            #    weekly = 3;
            #    monthly = 1;
            #};
            "rpool/persist" = {
                hourly = 50;
                daily = 15;
                weekly = 3;
                monthly = 1;
            };
        };
    };

    services.syncoid = {
        enable = true;
        interval = "*-*-* 16:15:00";

        #localSourceAllow = config.services.syncoid.localSourceAllow ++ [ "mount" ];
        #localTargetAllow = config.services.syncoid.localTargetAllow ++ [ "destroy" ];

        # Must first log in manually to remote
        # RUN AS ROOT: su syncoid -s /run/current-system/sw/bin/bash
        # Then ssh into remote
        sshKey = "/var/lib/syncoid/backup";
        commands."backup_persist" = {
             source = "rpool/persist";
             target = "hyperboly@192.168.100.130:pool-01/Desktop_Backups";
             extraArgs = [ "--sshport=2200"];
             recursive = true;
        };
    };

    systemd.services.sanoid.environment.TZ = lib.mkForce "Asia/Taipei";
}
