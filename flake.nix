{
  description = "CV";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-full latex-bin latexmk
          tools;
      };
    in
    rec {
      packages = {
        pdf = pkgs.stdenvNoCC.mkDerivation rec {
          name = "cv-pdf";
          src = self;
          buildInputs = [ pkgs.coreutils pkgs.ibm-plex tex ];
          phases = [ "unpackPhase" "buildPhase" "installPhase" ];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}"
            export TEMPDIR=$(mktemp -d)
            mkdir -p $TEMPDIR/.texcache/texmf-var
            env TEXMFHOME="$TEMPDIR/.texcache" \
              TEXMFVAR="$TEMPDIR/.texcache/texmf-var" \
              OSFONTDIR=${pkgs.ibm-plex}/share/fonts \
              latexmk -interaction=nonstopmode -pdf -lualatex \
              cv.tex
          '';
          installPhase = ''
            mkdir -p $out
            cp cv.pdf $out/
          '';
        };
      };
      defaultPackage."${system}" = packages.pdf;
      formatter."${system}" = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      devShells = pkgs.mkShell {
        buildInputs = packages.pdf.buildInputs;
      };
    };
}
