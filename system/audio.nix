{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.musnix.nixosModules.musnix
  ];

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.pam.loginLimits = [
    {
      domain = "@realtime";
      type = "-";
      item = "memlock";
      value = "8192000";
    }
    {
      domain = "@realtime";
      type = "-";
      item = "rtprio";
      value = "95";
    }
  ];


  musnix.enable = true;
}
