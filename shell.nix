{ pkgs ? import <nixpkgs> {}}:

with pkgs; mkShell {
  nativeBuildInputs = [
    cargo
    rustup
    (callPackage ./probe-run.nix {})
    flip-link
  ];
}
