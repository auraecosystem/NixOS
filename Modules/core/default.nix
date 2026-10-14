{ pkgs, ... }:

{
  # Enable modern Nix CLI and flake support on configured hosts.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Minimal useful tools; host-specific packages belong in optional modules.
  environment.systemPackages = with pkgs; [
    git
    vim
  ];
}
