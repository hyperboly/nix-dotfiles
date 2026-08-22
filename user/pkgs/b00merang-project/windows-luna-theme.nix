{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "windows-xp-gtk-theme";
  version = "3.1";

  src = pkgs.fetchFromGitHub {
    owner = "B00merang-Project";
    repo = "Windows-XP";
    rev = "3.1";
    hash = "";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r . $out/share/themes/Windows-XP
  '';
}
