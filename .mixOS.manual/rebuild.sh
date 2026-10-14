#!/usr/bin/env bash
set -e

# Navigate to your config directory
cd ~/dotfiles/nixos/

# Autoformat Nix files
alejandra . &>/dev/null

# Rebuild the system
sudo nixos-rebuild switch --flake .#default

# Commit to Git automatically using the new generation metadata
current=$(nixos-rebuild list-generations | grep current)
git commit -am "$current"
