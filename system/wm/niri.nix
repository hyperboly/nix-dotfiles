{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  imports = [ inputs.niri.nixosModules.niri ];
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
  niri-flake.cache.enable = true;
}
