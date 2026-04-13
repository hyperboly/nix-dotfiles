{ config, ... }:

{
  services.easyeffects = {
    enable = true;
    preset = "input-noise-reduction";

    extraPresets = {
      input-noise-reduction = {
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
      };

      moondrop-aria2-eq = {
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

      apple-earpods-eq = {
        output = {
          blocklist = [];
          plugins_order = [
            "equalizer#0"
          ];
          "equalizer#0" = {
            balance = 0.0;
            bypass = false;
            "input-gain" = -12.31;
            mode = "IIR";
            "num-bands" = 10;
            "output-gain" = 0.0;
            "pitch-left" = 0.0;
            "pitch-right" = 0.0;
            "split-channels" = false;

            left = {
              band0 = {
                frequency = 105.0;
                gain = 11.899999618530273;
                mode = "APO (DR)";
                mute = false;
                q = 0.6666666865348816;
                slope = "x1";
                solo = false;
                type = "Lo-shelf";
                width = 4.0;
              };
              band1 = {
                frequency = 44.5;
                gain = 0.20000000298023224;
                mode = "APO (DR)";
                mute = false;
                q = 3.0399999618530273;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band2 = {
                frequency = 69.9000015258789;
                gain = 2.299999952316284;
                mode = "APO (DR)";
                mute = false;
                q = 2.369999885559082;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band3 = {
                frequency = 243.1999969482422;
                gain = 0.6000000238418579;
                mode = "APO (DR)";
                mute = false;
                q = 1.350000023841858;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band4 = {
                frequency = 452.70001220703125;
                gain = 1.7999999523162842;
                mode = "APO (DR)";
                mute = false;
                q = 1.0099999904632568;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band5 = {
                frequency = 1750.0999755859375;
                gain = -7.400000095367432;
                mode = "APO (DR)";
                mute = false;
                q = 1.399999976158142;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band6 = {
                frequency = 2233.39990234375;
                gain = -1.5;
                mode = "APO (DR)";
                mute = false;
                q = 3.6500000953674316;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band7 = {
                frequency = 3613.39990234375;
                gain = 4.599999904632568;
                mode = "APO (DR)";
                mute = false;
                q = 1.75;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band8 = {
                frequency = 5464.10009765625;
                gain = -6.599999904632568;
                mode = "APO (DR)";
                mute = false;
                q = 4.809999942779541;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band9 = {
                frequency = 10000.0;
                gain = 5.0;
                mode = "APO (DR)";
                mute = false;
                q = 0.6666666865348816;
                slope = "x1";
                solo = false;
                type = "Hi-shelf";
                width = 4.0;
              };
            };

            right = {
              band0 = {
                frequency = 105.0;
                gain = 11.899999618530273;
                mode = "APO (DR)";
                mute = false;
                q = 0.6666666865348816;
                slope = "x1";
                solo = false;
                type = "Lo-shelf";
                width = 4.0;
              };
              band1 = {
                frequency = 44.5;
                gain = 0.20000000298023224;
                mode = "APO (DR)";
                mute = false;
                q = 3.0399999618530273;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band2 = {
                frequency = 69.9000015258789;
                gain = 2.299999952316284;
                mode = "APO (DR)";
                mute = false;
                q = 2.369999885559082;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band3 = {
                frequency = 243.1999969482422;
                gain = 0.6000000238418579;
                mode = "APO (DR)";
                mute = false;
                q = 1.350000023841858;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band4 = {
                frequency = 452.70001220703125;
                gain = 1.7999999523162842;
                mode = "APO (DR)";
                mute = false;
                q = 1.0099999904632568;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band5 = {
                frequency = 1750.0999755859375;
                gain = -7.400000095367432;
                mode = "APO (DR)";
                mute = false;
                q = 1.399999976158142;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band6 = {
                frequency = 2233.39990234375;
                gain = -1.5;
                mode = "APO (DR)";
                mute = false;
                q = 3.6500000953674316;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band7 = {
                frequency = 3613.39990234375;
                gain = 4.599999904632568;
                mode = "APO (DR)";
                mute = false;
                q = 1.75;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band8 = {
                frequency = 5464.10009765625;
                gain = -6.599999904632568;
                mode = "APO (DR)";
                mute = false;
                q = 4.809999942779541;
                slope = "x1";
                solo = false;
                type = "Bell";
                width = 4.0;
              };
              band9 = {
                frequency = 10000.0;
                gain = 5.0;
                mode = "APO (DR)";
                mute = false;
                q = 0.6666666865348816;
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
  };
}
