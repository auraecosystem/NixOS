# NixOS configuration

A maintainable, flake-based NixOS configuration repository organized around reusable
modules, explicit host configurations, reproducible inputs, and automated checks.

## Status

- **Implemented:** root flake, pinned nixpkgs input, shared core module, module
  evaluation test, formatter, GitHub Actions CI, and architecture/installation/
  development documentation.
- **Not yet configured:** no real host is exported under `nixosConfigurations`.
  Hardware, boot, filesystem, user, network, and secret settings must be collected
  from the actual machine before deployment.
- **Safe by default:** no guessed host or hardware configuration is provided, and the
  default module imports only the small core baseline.

## Layout

```text
NixOS/
├── flake.nix
├── flake.lock
├── README.md
├── nixosConfigurations/
│   └── README.md
├── Modules/
│   ├── core/
│   ├── development/
│   ├── desktop/
│   ├── security/
│   └── services/
├── nix/
│   ├── overlays/
│   └── packages/
├── tests/
│   ├── evaluation/
│   └── integration/
├── docs/
└── .github/workflows/ci.yml
```

## Development checks

With Nix and flakes enabled:

```sh
nix run .#formatter.x86_64-linux -- flake.nix Modules/core/default.nix Modules/default.nix tests/evaluation/default.nix
nix run .#formatter.x86_64-linux -- --check flake.nix Modules/core/default.nix Modules/default.nix tests/evaluation/default.nix
nix flake check --show-trace
```

CI runs formatting validation and `nix flake check` on pull requests, pushes to
`main`, and manual dispatches.

## Add a host

Read [docs/installation.md](docs/installation.md) and
[nixosConfigurations/README.md](nixosConfigurations/README.md) before creating a
host directory. Generate the hardware configuration on the target machine, add only
the modules it needs, and export it explicitly from the flake. Do not run
`nixos-rebuild switch` until the target-specific configuration has been evaluated
and reviewed.

## Secrets

Never put credentials in Nix expressions or use `pkgs.writeText` to embed secrets:
Nix store paths can be world-readable. Use an appropriate secret manager or protected
runtime secret files.
