{
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-23.11"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in rec {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs;
            [
              (python310.withPackages
                (ps: with ps; [ ipython jupyterlab numpy pandas matplotlib ]))
            ];
          shellHook = ''
            if [ ! -d venv ]; then
              echo "Virtual environment not found. Creating one..."
              python3 -m venv venv
            fi

            . venv/bin/activate
            echo Hello, welcome to the notebook dev environment!
          '';
        };
      });
}
