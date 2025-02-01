{
  description = "A demo of sqlite-web and multiple postgres services";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    heroicons.url = "github:tailwindlabs/heroicons/v2.1.1";
    heroicons.flake = false;
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
            let
              translatedPlatform =
                {
                  aarch64-darwin = "macos-arm64";
                  aarch64-linux = "linux-arm64";
                  armv7l-linux = "linux-armv7";
                  x86_64-darwin = "macos-x64";
                  x86_64-linux = "linux-x64";
                }
                .${system};
            in
            with pkgs;
            with pkgs.beamPackages;
            mixRelease {
              inherit pname version src;
              mixFodDeps = fetchMixDeps {
                inherit version src pname;
                sha256 = "sha256-bEaxsw3OdRoiGoi1Vv2k0QxNT/PdGDGsOf5UDho3L1o=";
                buildInputs = [ ];
                propagatedBuildInputs = [ ];
              };
              preInstall = ''
                ln -s ${tailwindcss}/bin/tailwindcss _build/tailwind-${translatedPlatform}
                ln -s ${esbuild}/bin/esbuild _build/esbuild-${translatedPlatform}

                ${elixir}/bin/mix assets.deploy
                ${elixir}/bin/mix phx.gen.release
              '';
            };

          packages.deps_nix =
            with pkgs;
            with pkgs.beamPackages;
            mixRelease {
              inherit pname version src;
              mixNixDeps = import ./hello/deps.nix { inherit lib beamPackages pkgs; };
            };
        };
    };
}
