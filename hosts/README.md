# Host configurations

This repository intentionally does not publish a deployable host configuration yet.
The existing files contain placeholder hostnames, missing imports, and no verified
hardware configuration, so treating them as a real machine would be unsafe.

When adding a machine:

1. Create `hosts/<hostname>/configuration.nix`.
2. Keep generated hardware settings in `hosts/<hostname>/hardware-configuration.nix`.
3. Import the shared module with `../../modules/base.nix` and the host's hardware file.
4. Add an explicit `nixosConfigurations.<hostname>` output to the root `flake.nix`.
5. Set `system.stateVersion` to the release used when that machine was first installed.
6. Review boot, disk/filesystem, networking, users, SSH access, secrets, and rollback
   behavior on that machine before running `nixos-rebuild switch`.

Do not commit private keys, passwords, API tokens, or unencrypted secret files. Hardware,
host identity, timezone, user accounts, and remote deployment targets must be confirmed
for the actual machine rather than copied from the old examples.
