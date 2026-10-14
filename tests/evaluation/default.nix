{ nixpkgs, system }:

let
  pkgs = nixpkgs.legacyPackages.${system};

  evaluated = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../Modules/default.nix
      {
        networking.hostName = "nixos-ci";
        system.stateVersion = "24.11";
        boot.isContainer = true;
      }
    ];
  };

  hasGit = builtins.any (
    package: (package.pname or "") == "git"
  ) evaluated.config.environment.systemPackages;

in
assert evaluated.config.networking.hostName == "nixos-ci";
assert hasGit;
pkgs.runCommand "nixos-module-evaluation" { } ''
  touch "$out"
''
