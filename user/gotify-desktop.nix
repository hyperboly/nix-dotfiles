{config, ...}:
{
  home.file."${config.xdg.configHome}/gotify-desktop/config.toml".text = ''
    [gotify]
    # gotify server websocket URL, use wss:// prefix for TLS, or ws:// for unencrypted
      url = "wss://gotify.hyperboly.net"
    
    # secret gotify token
      token = "CYQEWo0.srKxi77"
    # if you want to get the token from a password manager, or other external command,
    # you can also use for example:
    # token = { command = "secret-tool lookup Title 'Gotify token'" }
    
    # optional, if true, deletes messages that have been handled, defaults to false
      auto_delete = false
    
      [notification]
    # optional, ignores messages with priority lower than given value, defaults to 0
      min_priority = 0
  '';
}
