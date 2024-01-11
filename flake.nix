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
      inherit (pkgs.texlive) scheme-small latex-bin latexmk
      tools fontspec geometry titling;
    };
  in
  rec {
    packages = {
      pdf = pkgs.stdenvNoCC.mkDerivation rec {
        name = "cv-pdf";
        src = self;
        buildInputs = [ pkgs.coreutils pkgs.pretendard tex ];
        phases = ["unpackPhase" "buildPhase" "installPhase"];
        buildPhase = ''
          export PATH="${pkgs.lib.makeBinPath buildInputs}"
          export TEMPDIR=$(mktemp -d)
          mkdir -p $TEMPDIR/.texcache/texmf-var
          env TEXMFHOME="$TEMPDIR/.texcache" \
            TEXMFVAR="$TEMPDIR/.texcache/texmf-var" \
            OSFONTDIR=${pkgs.pretendard}/share/fonts \
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
    devShells = pkgs.mkShell {
      buildInputs = packages.pdf.buildInputs;
    };
  };
}
