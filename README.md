# NixOS configuration

A small, modular NixOS configuration repository. Shared defaults live in
`modules/`; machine-specific hardware and settings belong in `hosts/<hostname>/`.

## Current state

- **Implemented:** root flake, reusable base module, module-evaluation check,
  pinned flake inputs, formatter, and GitHub Actions CI.
- **Not yet configured:** a real host under `nixosConfigurations`. The repository
  does not contain verified hardware settings or confirmed user/network/boot details.
- **Not a deployment instruction:** do not run `nixos-rebuild switch` against a real
  machine until a host configuration has been added and reviewed.

## Development

Install Nix with flakes enabled, then run:

```sh
nix run .#formatter.x86_64-linux -- flake.nix modules/base.nix tests/module-evaluation.nix
nix run .#formatter.x86_64-linux -- --check flake.nix modules/base.nix tests/module-evaluation.nix
nix flake check --show-trace
```

The CI workflow runs formatting validation and `nix flake check` on pushes to
`main`, pull requests, and manual dispatches.

## Layout

- `flake.nix` — flake outputs and the shared module export.
- `flake.lock` — pinned nixpkgs revision for reproducible evaluation.
- `modules/base.nix` — small reusable baseline.
- `tests/module-evaluation.nix` — evaluates the base module and asserts key settings.
- `hosts/README.md` — checklist for adding a real machine safely.

## Secrets

Never place credentials in Nix expressions or use `pkgs.writeText` to embed secrets:
Nix store paths can be world-readable. Use a secret-management approach appropriate to
the target host and pass secret file paths into service modules.
