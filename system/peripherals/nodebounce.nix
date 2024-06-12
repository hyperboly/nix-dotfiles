{ config, lib, ... }:

{
    environment.etc."libinput/local-overrides.quirks" = {
        text = ''
            [ROCCAT ROCCAT Kain 120 Aimo]
            MatchName=ROCCAT ROCCAT Kain 120 Aimo
            ModelBouncingKeys=1
        '';
    };
}
