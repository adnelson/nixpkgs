{ config, pkgs, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/virtualisation/amazon-image.nix"
    ./amazon-init.nix
  ];
}
