{ config, pkgs-unstable, lib, userSettings, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 320;
        height = 300;
        offset = "30x30";
        origin = "top-right";
        transparency = 13;
        padding = 12;
        horizontal_padding = 12;

        font = lib.mkForce "Monocraft 12";
      };

      play_sound = {
        summary = "*";
        script = userSettings.dotfiles_dir+"/user/notifications/scripts/alert.sh";
      };
    };
  };

  systemd.user.timers."check_bat_low" = {
    Unit.Description = "check if battery is <20% via script every 5 mins";
    Install.WantedBy = [ "timers.target" ];
    Timer = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "check_bat_low.service";
    };
  };
  systemd.user.services."check_bat_low" = {
    Unit.Description = "check if battery is <20% via script";
    Install.WantedBy = [ "default.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = "${userSettings.dotfiles_dir}/user/notifications/scripts/battery-low.sh";
    };
  };
}
