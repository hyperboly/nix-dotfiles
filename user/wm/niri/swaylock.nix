{ config, pkgs, ... }:

{
  services = {
    swayidle = {
      enable = true;
      package = pkgs.swayidle;
      timeouts = [
        { 
          timeout = 150;
          command = "brightnessctl -s set 10";         # set monitor backlight to minimum, avoid 0 on OLED monitor.
        }
        {
          timeout = 150;
          command = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
        }
        {
          timeout = 300;
          command = "swaylock -fF";            # lock screen when timeout has passed
        }
        {
          timeout = 330;
          command = "niri msg action power-off-monitors";        # screen off when timeout has passed
        }
        {
          timeout = 1800;
          command = "systemctl suspend";                # suspend pc
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "swaylock -fF";
        }
        {
          event = "after-resume";
          command = "niri msg action power-on-monitors & brightnessctl -r & brightnessctl -rd rgb:kbd_backlight";
        }
      ];
    };
  };

  programs.swaylock = {
    enable = true;
  };
}
