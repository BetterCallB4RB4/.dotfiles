{ config, lib, pkgs, ... }:

{
  # WSL doesn’t expose hardware like disks or GPUs
  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
  };

  swapDevices = [ ];
}
