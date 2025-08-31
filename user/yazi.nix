{ config, pkgs-unstable, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;
    enableBashIntegration = true;
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
        prepend_keymap = {
          on = "y";
          run = [
            ''shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' --confirm''
            "yank"
          ];
        };
      };
      preview = {
        max_width = 900;
        max_height = 1000;
        image_filter = "nearest";
      };
    };
  };
}
