{ config, pkgs, ... }:

{
  imports = [
    ../common.nix
    ../graphical.nix
    ../libinput.nix
    ../../hardware-configuration.nix # Include the results of the hardware scan.
    #../steam.nix
    #../../nixos-hardware/dell/xps-15-9550.nix # from the nixos-hardware repo
  ];

  services.xserver.libinput.enable = true;
	virtualisation.virtualbox.host.enable = true;

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    enableCryptodisk = true;
  };

  # For Intel Graphics to work, 4.1 is too low, and 4.4 is sufficient
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.hostName = "zigpolymath"; # Define your hostname.

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}
