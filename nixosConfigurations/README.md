# Host configurations

Create one directory per real machine:

```text
nixosConfigurations/<host>/
├── default.nix
└── hardware-configuration.nix
```

The hardware file should be generated on the target installation (for example with
`nixos-generate-config`) and reviewed before use. Do not copy hardware, filesystem,
bootloader, user, hostname, or network settings from another machine.

Each host's `default.nix` should import the shared modules it needs and its own
hardware configuration. Add the host explicitly to `nixosConfigurations` in the
root flake only after it has been evaluated. This repository intentionally has no
fake host or guessed hardware configuration.
