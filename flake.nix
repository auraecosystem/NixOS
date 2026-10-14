{
  description = "Maintainable, modular NixOS configuration repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosModules.core = import ./Modules/core/default.nix;
      nixosModules.default = import ./Modules/default.nix;

      checks.${system}.module-evaluation = import ./tests/evaluation/default.nix {
        inherit nixpkgs system;
      };

      formatter.${system} = pkgs.nixfmt;
    };
}
