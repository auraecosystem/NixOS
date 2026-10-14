{ pkgs, ... }:

{
  # Enable modern Nix CLI and flake support on systems using this module.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Keep the shared baseline small; host-specific services, users, locale,
  # networking, storage, and boot settings belong in host modules.
  environment.systemPackages = with pkgs; [
    git
    vim
  ];
}
