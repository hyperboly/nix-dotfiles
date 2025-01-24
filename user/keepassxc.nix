{config, ...}:
{
  home.file."${config.xdg.configHome}/keepassxc/keepassxc.ini".text = ''
[General]
ConfigVersion=2

[GUI]
ApplicationTheme=dark

[PasswordGenerator]
AdditionalChars=
ExcludedChars=
  '';
}
