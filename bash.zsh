# To build the MixOS manual / documentation
nix build '.#mixos.manual'

# To view the generated documentation
xdg-open result/share/doc/mixos/index.html
