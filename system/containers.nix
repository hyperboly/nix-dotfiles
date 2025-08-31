{ config, lib, pkgs, ... }:

{
  virtualisation = {
    docker = {
      # Consider disabling the system wide Docker daemon
      enable = false;

      rootless = {
        enable = true;
        setSocketVariable = true;
        # Optionally customize rootless Docker daemon settings
        daemon.settings = {
          dns = [ "1.1.1.1" "8.8.8.8" ];
          registry-mirrors = [ "https://mirror.gcr.io" ];
        };
      };
    };

    oci-containers = {
      #backend = "docker";
      containers = {
        kanboard = {
          autoStart = true;
          #pull = "always";
          image = "kanboard/kanboard:latest";
          ports = ["127.0.0.1:8181:80"];
          volumes = [
            "${config.users.users.hyperboly.home}/Public/kanban/:/var/www/app/data"
            "${config.users.users.hyperboly.home}/Public/kanban/plugins:/var/www/app/plugins"
          ];
          # environment = {
          #   PLUGIN_INSTALLER = "true";
          # };
        };
      };
    };
  };
}
