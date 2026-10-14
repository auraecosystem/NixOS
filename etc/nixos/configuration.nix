{ config, lib, inputs, ... }: {
  # do something with home-manager here, for instance:
  imports = [ inputs.home-manager.nixosModules.default ];
  ...
services.nginx.enable = true;
environment.systemPackages = [ pkgs.git pkgs.htop ];
}
