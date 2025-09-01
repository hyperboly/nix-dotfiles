{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "eww-niri-workspaces";
  version = "unstable-2025-08-22";

  src = fetchFromGitHub {
    owner = "druskus20";
    repo = "eww-niri-workspaces";
    rev = "0a8d4eb4c418283533703afa91f32e042be8acf1";
    hash = "sha256-acMek37KBS0sTFN+AoA1/6LzQIiYEZ6wpROAgFhs71s=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "niri-ipc-25.5.1" = "sha256-0FZ5UuXN59CGs3+E/y5xFnmxNwIz5GcRWrb5zbJfuAM=";
    };
  };

  meta = {
    description = "A rust binary that outputs workspace information from niri-ipc to be consumed by eww";
    homepage = "https://github.com/druskus20/eww-niri-workspaces";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "eww-niri-workspaces";
  };
}
