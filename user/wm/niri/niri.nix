{ config, ... }:

{
  home.file.".config/niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/user/wm/niri/config.kdl";
  programs.swaylock.enable = true;
}
