{
  description = "Maintainable, modular NixOS configuration repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosModules.base = import ./modules/base.nix;
      nixosModules.default = self.nixosModules.base;

      checks.${system}.module-evaluation =
        import ./tests/module-evaluation.nix {
          inherit nixpkgs system;
        };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
