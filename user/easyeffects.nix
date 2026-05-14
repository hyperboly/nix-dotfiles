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
      framework-speakers = {
        output = {
          blocklist = [];

          plugins_order = [
            "filter#1"
            "bass_enhancer#0"
            "multiband_compressor#0"
            "stereo_tools#0"
            "limiter#0"
          ];

          "bass_enhancer#0" = {
            amount = 7.999999999999986;
            blend = 0.0;
            bypass = false;
            floor = 10.0;
            "floor-active" = true;
            harmonics = 10.0;
            "input-gain" = 0.0;
            "output-gain" = 0.0;
            scope = 200.0;
          };

          "filter#1" = {
            balance = 0.0;
            bypass = false;
            "equal-mode" = "IIR";
            frequency = 100.0;
            gain = 36.0;
            "input-gain" = 0.0;
            mode = "RLC (BT)";
            "output-gain" = 0.0;
            quality = 0.0;
            slope = "x1";
            type = "High-pass";
            width = 4.0;
          };

          "limiter#0" = {
            alr = false;
            "alr-attack" = 5.0;
            "alr-knee" = 0.0;
            "alr-release" = 50.0;
            attack = 2.0;
            bypass = false;
            dithering = "None";
            "external-sidechain" = false;
            "gain-boost" = true;
            "input-gain" = 0.0;
            lookahead = 4.0;
            mode = "Herm Thin";
            "output-gain" = 0.0;
            oversampling = "Half x4(2L)";
            release = 8.0;
            "sidechain-preamp" = 0.0;
            "stereo-link" = 100.0;
            threshold = 0.0;
          };

          "multiband_compressor#0" = {
            band0 = {
              "attack-threshold" = -16.0;
              "attack-time" = 150.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "external-sidechain" = false;
              knee = -12.0;
              makeup = 4.999999999999997;
              mute = false;
              ratio = 5.0;
              "release-threshold" = -100.0;
              "release-time" = 300.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 500.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 10.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "stereo-split-source" = "Left/Right";
            };

            band1 = {
              "attack-threshold" = -24.0;
              "attack-time" = 150.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = true;
              "external-sidechain" = false;
              knee = -9.0;
              makeup = -1.942890293094024e-16;
              mute = false;
              ratio = 3.0;
              "release-threshold" = -100.0;
              "release-time" = 200.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 1000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 500.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 250.0;
              "stereo-split-source" = "Left/Right";
            };

            band2 = {
              "attack-threshold" = -12.0;
              "attack-time" = 100.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = true;
              "external-sidechain" = false;
              knee = -9.0;
              makeup = 1.4999999999999987;
              mute = false;
              ratio = 3.0;
              "release-threshold" = -100.0;
              "release-time" = 150.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 2000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 1000.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 1250.0;
              "stereo-split-source" = "Left/Right";
            };

            band3 = {
              "attack-threshold" = -24.0;
              "attack-time" = 80.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = true;
              "external-sidechain" = false;
              knee = -9.0;
              makeup = 4.9999999999999964;
              mute = false;
              ratio = 4.0;
              "release-threshold" = -100.0;
              "release-time" = 120.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 4000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 2000.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 5000.0;
              "stereo-split-source" = "Left/Right";
            };

            band4 = {
              "attack-threshold" = -12.0;
              "attack-time" = 20.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = false;
              "external-sidechain" = false;
              knee = -6.0;
              makeup = 0.0;
              mute = false;
              ratio = 1.0;
              "release-threshold" = -100.0;
              "release-time" = 100.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 8000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 4000.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 4000.0;
              "stereo-split-source" = "Left/Right";
            };

            band5 = {
              "attack-threshold" = -12.0;
              "attack-time" = 20.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = false;
              "external-sidechain" = false;
              knee = -6.0;
              makeup = 0.0;
              mute = false;
              ratio = 1.0;
              "release-threshold" = -100.0;
              "release-time" = 100.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 12000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 8000.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 8000.0;
              "stereo-split-source" = "Left/Right";
            };

            band6 = {
              "attack-threshold" = -12.0;
              "attack-time" = 20.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = false;
              "external-sidechain" = false;
              knee = -6.0;
              makeup = 0.0;
              mute = false;
              ratio = 1.0;
              "release-threshold" = -100.0;
              "release-time" = 100.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 16000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 12000.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 12000.0;
              "stereo-split-source" = "Left/Right";
            };

            band7 = {
              "attack-threshold" = -12.0;
              "attack-time" = 20.0;
              "boost-amount" = 6.0;
              "boost-threshold" = -72.0;
              "compression-mode" = "Downward";
              "compressor-enable" = true;
              "enable-band" = false;
              "external-sidechain" = false;
              knee = -6.0;
              makeup = 0.0;
              mute = false;
              ratio = 1.0;
              "release-threshold" = -100.0;
              "release-time" = 100.0;
              "sidechain-custom-highcut-filter" = false;
              "sidechain-custom-lowcut-filter" = false;
              "sidechain-highcut-frequency" = 20000.0;
              "sidechain-lookahead" = 0.0;
              "sidechain-lowcut-frequency" = 16000.0;
              "sidechain-mode" = "RMS";
              "sidechain-preamp" = 0.0;
              "sidechain-reactivity" = 10.0;
              "sidechain-source" = "Middle";
              solo = false;
              "split-frequency" = 16000.0;
              "stereo-split-source" = "Left/Right";
            };

            bypass = false;
            "compressor-mode" = "Modern";
            dry = -100.0;
            "envelope-boost" = "None";
            "input-gain" = -3.0;
            "output-gain" = 0.0;
            "stereo-split" = false;
            wet = 0.0;
          };

          "stereo_tools#0" = {
            "balance-in" = 0.0;
            "balance-out" = 0.0;
            bypass = false;
            delay = 0.0;
            "input-gain" = 0.0;
            "middle-level" = 0.0;
            "middle-panorama" = 0.0;
            mode = "LR > LR (Stereo Default)";
            mutel = false;
            muter = false;
            "output-gain" = 0.0;
            phasel = false;
            phaser = false;
            "sc-level" = 1.0;
            "side-balance" = 0.0;
            "side-level" = 0.0;
            softclip = false;
            "stereo-base" = 0.1499999999999999;
            "stereo-phase" = 0.0;
          };
        };
      };
    };
  };
}
