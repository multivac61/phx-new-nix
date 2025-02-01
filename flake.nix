{
  description = "A demo of sqlite-web and multiple postgres services";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [ ];
      perSystem =
        {
          pkgs,
          self',
          system,
          lib,
          ...
        }:
        let
          src = ./hello;
          mixExs = builtins.readFile "${src}/mix.exs";
          pname = builtins.head (builtins.match ".*app:[[:space:]]*:([a-zA-Z0-9_]+).*" mixExs);
          version = builtins.head (
            builtins.match ".*version:[[:space:]]*\"([0-9]+\\.[0-9]+\\.[0-9]+)\".*" mixExs
          );
          # Explicitly declare tailwind and esbuild binary paths (don't let Mix fetch them)
          preConfigure = ''
            substituteInPlace config/config.exs \
              --replace "config :tailwind," "config :tailwind, path: \"${pkgs.tailwindcss}/bin/tailwindcss\","\
              --replace "config :esbuild," "config :esbuild, path: \"${pkgs.esbuild}/bin/esbuild\", "

          '';

          preInstall = ''
            # Deploy assets before creating release: https://github.com/phoenixframework/phoenix/issues/2690
            mix do deps.loadpaths --no-deps-check, assets.deploy
          '';
        in
        {
          devShells.default = pkgs.mkShell {
            packages = lib.optionals pkgs.stdenv.isLinux [ pkgs.inotify-tools ];
            inputsFrom = [
              self'.packages.fod
              self'.packages.deps_nix
            ];
          };

          packages.fod =
            with pkgs.beamPackages;
            mixRelease {
              inherit
                pname
                version
                src
                preConfigure
                preInstall
                ;
              mixFodDeps = fetchMixDeps {
                inherit version src pname;
                sha256 = "sha256-KDQh1f347ASDjYZSZ3iDMfy1Rv61jdgaaaBbTVayUPs=";
              };
            };

          packages.deps_nix =
            with pkgs.beamPackages;
            beamPackages.mixRelease {
              inherit
                pname
                version
                src
                preConfigure
                preInstall
                ;
              mixNixDeps = import ./hello/deps.nix { inherit lib beamPackages pkgs; };
            };

          packages.mix2nix =
            with pkgs.beamPackages;
            beamPackages.mixRelease {
              inherit
                pname
                version
                src
                preConfigure
                preInstall
                ;
              mixNixDeps = import ./hello/mix2nix-deps.nix { inherit lib beamPackages; };
            };

          checks = self'.packages // self'.devShells;
        };
    };
}
