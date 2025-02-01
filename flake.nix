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
          translatedPlatform =
            {
              aarch64-darwin = "macos-arm64";
              aarch64-linux = "linux-arm64";
              armv7l-linux = "linux-armv7";
              x86_64-darwin = "macos-x64";
              x86_64-linux = "linux-x64";
            }
            .${system};
          preInstall = ''
            ln -s ${pkgs.tailwindcss}/bin/tailwindcss _build/tailwind-${translatedPlatform}
            ln -s ${pkgs.esbuild}/bin/esbuild _build/esbuild-${translatedPlatform}

            ${pkgs.elixir}/bin/mix assets.deploy
            ${pkgs.elixir}/bin/mix phx.gen.release
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
                preInstall
                ;
              mixFodDeps = fetchMixDeps {
                inherit version src pname;
                sha256 = "sha256-bEaxsw3OdRoiGoi1Vv2k0QxNT/PdGDGsOf5UDho3L1o=";
              };
            };

          packages.deps_nix =
            with pkgs.beamPackages;
            beamPackages.mixRelease {
              inherit
                pname
                version
                src
                preInstall
                ;
              mixNixDeps = import ./hello/deps.nix { inherit lib beamPackages pkgs; };
            };
        };
    };
}
