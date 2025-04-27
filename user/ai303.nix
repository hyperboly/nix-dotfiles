{config, ...}:

{
  home.file."${config.xdg.configHome}/wireplumber/wireplumber.conf.d/50-ai303.conf".text = ''
    monitor.alsa.rules = [
      {
        matches = [
          {
            node.name = "alsa_output.usb-TEAC_Corporation_AI-303-00.analog-stereo"
          }
        ]
        actions = {
          update-props = {
            audio.format = "S24LE",
            audio.rate = "96000"
          }
        }
      }
    ]
  '';
}
