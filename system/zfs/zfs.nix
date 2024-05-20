{configs, pkgs, ...}

{
    services.zfs.autoScrub.enable = true;
    #services.sanoid.enable = true;
    #services.sanoid.datasets = {
    #};
    #services.sanoid.datasets.rpool.autoprune = true;
    #services.sanoid.datasets.rpool.autosnap = true;
}
