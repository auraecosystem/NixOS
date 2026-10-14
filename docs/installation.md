# Installation and host onboarding

This repository does not yet describe a verified machine, so it is not ready to run
`nixos-rebuild switch` on a real host.

1. Install NixOS on the target machine and generate its hardware configuration.
2. Create `nixosConfigurations/<host>/default.nix` and keep the generated
   `hardware-configuration.nix` beside it.
3. Import `../../Modules/default.nix`, the host hardware file, and only the optional
   modules the machine needs.
4. Set `system.stateVersion` to the release used for the initial installation; do not
   change it casually during upgrades.
5. Add an explicit `nixosConfigurations.<host>` output to `flake.nix`.
6. Run `nix flake check --show-trace` and evaluate the specific host with
   `nix eval .#nixosConfigurations.<host>.config.system.build.toplevel.drvPath`.
7. Review bootloader, disks, filesystems, users, SSH, firewall, secrets, and rollback
   access on the machine before applying a switch.

Never commit credentials or invent hardware identifiers, filesystems, or user accounts
to make an example appear deployable.
