{ config, ... }:

{
  services.easyeffects = {
    enable = true;
    preset = "my-preset";

    my-preset = {
      input = {
        blocklist = [];
        plugins_order = [
          "rnnoise#0"
        ];
        "rnnoise#0" = {
          bypass = false;
          "enable-vad" = true;
          "input-gain" = 0.0;
          "model-name" = "";
          "output-gain" = 0.0;
          release = 20.0;
          "use-standard-model" = true;
          "vad-thres" = 50.0;
          wet = 0.0;
        };
      };

      output = {
        blocklist = [];
        plugins_order = [
          "equalizer#0"
        ];
        "equalizer#0" = {
          balance = 0.0;
          bypass = false;
          "input-gain" = -5.02;
          mode = "IIR";
          "num-bands" = 10;
          "output-gain" = 0.0;
          "pitch-left" = 0.0;
          "pitch-right" = 0.0;
          "split-channels" = false;

          left = {
            band0 = {
              frequency = 29.952623149688797;
              gain = 1.0;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Lo-shelf";
              width = 4.0;
            };
            band1 = {
              frequency = 59.763340205038524;
              gain = -3.200000047683716;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372453;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band2 = {
              frequency = 119.24354052777788;
              gain = -0.6000000238418579;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band3 = {
              frequency = 237.92214271853953;
              gain = 0.4000000059604645;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band4 = {
              frequency = 474.71708526294935;
              gain = 2.0;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372453;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band5 = {
              frequency = 947.1851104970312;
              gain = -0.8999999761581421;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band6 = {
              frequency = 1889.8827562743609;
              gain = 1.399999976158142;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372449;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band7 = {
              frequency = 3770.811843303749;
              gain = 4.800000190734863;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372449;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band8 = {
              frequency = 7523.758767782307;
              gain = 1.7000000476837158;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372453;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band9 = {
              frequency = 15011.87233627273;
              gain = -1.100000023841858;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Hi-shelf";
              width = 4.0;
            };
          };

          right = {
            band0 = {
              frequency = 29.952623149688797;
              gain = 1.0;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Lo-shelf";
              width = 4.0;
            };
            band1 = {
              frequency = 59.763340205038524;
              gain = -3.200000047683716;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372453;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band2 = {
              frequency = 119.24354052777788;
              gain = -0.6000000238418579;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band3 = {
              frequency = 237.92214271853953;
              gain = 0.4000000059604645;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band4 = {
              frequency = 474.71708526294935;
              gain = 2.0;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372453;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band5 = {
              frequency = 947.1851104970312;
              gain = -0.8999999761581421;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band6 = {
              frequency = 1889.8827562743609;
              gain = 1.399999976158142;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372449;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band7 = {
              frequency = 3770.811843303749;
              gain = 4.800000190734863;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372449;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band8 = {
              frequency = 7523.758767782307;
              gain = 1.7000000476837158;
              mode = "APO (DR)";
              mute = false;
              q = 1.5047602375372453;
              slope = "x1";
              solo = false;
              type = "Bell";
              width = 4.0;
            };
            band9 = {
              frequency = 15011.87233627273;
              gain = -1.100000023841858;
              mode = "APO (DR)";
              mute = false;
              q = 1.504760237537245;
              slope = "x1";
              solo = false;
              type = "Hi-shelf";
              width = 4.0;
            };
          };
        };
      };
    };
  };
}
