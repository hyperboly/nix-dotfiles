{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "windows-xp-luna-gtk-icons";
  version = "3.1";

  src = pkgs.fetchFromGitHub {
    owner = "B00merang-Project";
    repo = "Windows-XP";
    rev = "3.1";
    hash = "sha256-VVNYf2jTa5lqL6RvKT7Hq2NqwUHpdqvjhMCjY3h6Hjs=";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p "$out/share/icons"
    cp -r "$src/Windows XP Luna" "$out/share/icons/Windows XP Luna"
  '';
}
