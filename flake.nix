{
  description = "CV";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }: 
  with flake-utils.lib; eachSystem allSystems (system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
    tex = pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-minimal latex-bin latexmk;
    };
  in
  rec {
    packages = {
      pdf = pkgs.stdenvNoCC.mkDerivation rec {
        name = "cv-pdf";
        src = self;
        buildInputs = [ pkgs.coreutils tex ];
        phases = ["unpackPhase" "buildPhase" "installPhase"];
        buildPhase = ''
          export PATH="${pkgs.lib.makeBinPath buildInputs}";
          mkdir -p .cache/texmf-var
          env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
            latexmk -interaction=nonstopmode -pdf -lualatex \
            cv.tex
        '';
        installPhase = ''
          mkdir -p $out
          cp cv.pdf $out/
        '';
      };
    };
    defaultPackage = packages.pdf;
  });
}
