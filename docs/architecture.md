# Architecture

The repository separates reusable policy from machine identity.

- `flake.nix` declares pinned inputs, module exports, checks, and formatter.
- `Modules/core/` contains the small shared baseline.
- `Modules/development/`, `desktop/`, `security/`, and `services/` hold opt-in
  configuration by concern.
- `nixosConfigurations/<host>/` contains settings and generated hardware for one
  real machine.
- `nix/overlays/` and `nix/packages/` hold package customizations.
- `tests/evaluation/` evaluates modules without booting a machine.
- `tests/integration/` documents tests that require a VM or privileged environment.

The default exported module intentionally imports only core. Hosts should opt into
desktop, development, security, and service modules based on their actual role.
No host configuration is exported until its hardware and operational requirements
have been verified.
