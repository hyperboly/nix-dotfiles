{ config, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    prefix = "C-f";
    extraConfig = ''
            set -g default-terminal "screen-256color"
            set -as terminal-features ",xterm-256color:RGB"
            set -g allow-passthrough on

            set -ga update-environment TERM
            set -ga update-environment TERM_PROGRAM
    '';
  };

  home.file.".tmux-layouts/dotfiles.session.sh".text = ''
# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/.dotfiles"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dotfiles"; then

  load_window "vim"
  new_window "term"
  select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
  '';

  home.file.".tmux-layouts/ansible.session.sh".text = ''
# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Public/ansible/homeserver"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "ansible"; then

  load_window "vim"
  new_window "terminal"
  select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
  '';

  home.file.".tmux-layouts/blog.session.sh".text = ''
# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Public/blog.hyperboly.net"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "blog"; then

    load_window "vim"
    new_window "misc"
    new_window "server"
    run_cmd "hugo serve -D --noHTTPCache"
    select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
  '';

  home.file.".tmux-layouts/docs.session.sh".text = ''
# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Public/hl-docs"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "docs"; then

    load_window "vim"
    new_window "term"
    new_window "server"
    run_cmd "hugo serve -D --noHTTPCache"
    select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
  '';
  home.file.".tmux-layouts/vim.window.sh".text = ''
# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/vim"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "vim"
split_v 30
run_cmd "nvim ." 0
select_pane 0

  '';
}
