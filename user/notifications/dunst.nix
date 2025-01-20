{ config, pkgs-unstable, lib, userSettings, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x30";
        origin = "top-right";
        transparency = 13;
        padding = 8;
        horizontal_padding = 8;

        font = lib.mkForce "Monocraft 12";
      };

      play_sound = {
        summary = "*";
        script = userSettings.dotfiles_dir+"/user/notifications/scripts/alert.sh";
      };
    };
  };
}
