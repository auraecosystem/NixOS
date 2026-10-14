# Development workflow

## Prerequisites

Install Nix with flakes enabled. The `flake.lock` file pins nixpkgs so local and CI
evaluation use the same input revision.

## Commands

```sh
nix run .#formatter.x86_64-linux -- flake.nix Modules/core/default.nix Modules/default.nix tests/evaluation/default.nix
nix run .#formatter.x86_64-linux -- --check flake.nix Modules/core/default.nix Modules/default.nix tests/evaluation/default.nix
nix flake check --show-trace
```

Add a test when adding module behavior. Evaluation checks should be quick and safe for
hosted CI; VM and privileged tests belong in the integration suite and may require a
dedicated runner.

Use an isolated branch and pull request for changes. Do not merge until CI passes and
the configuration has been reviewed for the target host.
