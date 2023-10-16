
{
  inputs = {
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        inherit (pkgs) lib;
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            gnumake
            go
            ncurses.dev
            gcc
            pkg-config
            unzip
            file
          ];
        };
      }
    );
}
