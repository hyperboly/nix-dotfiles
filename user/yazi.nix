{ config, pkgs-unstable, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;
    enableBashIntegration = true;
    keymap = {
      mgr.prepend_keymap = [
        { on = [ "g" "r" ]; run = ''shell -- ya emit cd "$(git rev-parse --show-toplevel)"''; }
        { on = [ "y" ]; run = [ "yank" ''shell -- for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'']; }
        { on = [ "<C-n>" ]; run = ''shell -- dragon-drop -x -i -T "$1"''; }
        { on = [ "!" ]; for = "unix"; run = ''shell "$SHELL" --block''; desc = "Open $SHELL here"; }
      ];
    };
    settings = {
      log = {
        enabled = false;
      };
      mgr = {
        show_hidden = true;
        sort_by = "alphabetical";
        sort_dir_first = true;
        sort_reverse = true;
        show_symlink = true;
        scrolloff = 10;
      };
      preview = {
        max_width = 900;
        max_height = 1000;
        image_filter = "nearest";
      };
    };
  };
}
