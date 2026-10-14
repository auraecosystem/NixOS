# Development module

Place opt-in development tooling in this module. Keep it separate from the core
baseline so server hosts do not inherit compilers, language runtimes, or IDE tools
unless the host explicitly imports them.

Prefer packages from the flake's pinned nixpkgs input. Put custom derivations in
`nix/packages/` and reusable package overrides in `nix/overlays/`.
