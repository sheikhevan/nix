# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/nix
    ../../modules/nixos/basics
    ../../modules/nixos/networking/wireless
    ../../modules/nixos/networking/firewall
    ../../modules/nixos/users/evan
    ../../modules/nixos/security/doas
    ../../modules/nixos/security/madaidan-sysctl
    ../../modules/nixos/security/madaidan-boot
    ../../modules/nixos/services/pipewire
    ../../modules/nixos/services/bluetooth
    ../../modules/nixos/services/mullvad
    ../../modules/nixos/services/trezord
    ../../modules/nixos/windowManagers/dwl
    ../../modules/nixos/programs/gnupg
    ../../modules/nixos/programs/ssh
    ../../modules/nixos/programs/nvf
    ../../modules/nixos/programs/dconf
    ../../modules/nixos/fonts/iosevka
    ../../modules/nixos/fonts/noto
  ];
  evan.nix.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EGL_PLATFORM = "wayland";
  };

  evan.basics = {
    enable = true;
    asahi = true;
    hostname = "hydrogen";
  };

  evan.networking = {
    wireless.enable = true;
    firewall.enable = true;
  };

  evan.users.evan.enable = true;

  evan.security.doas = {
    enable = true;
    users = ["evan"];
  };
  evan.security.madaidan-sysctl.enable = true;
  evan.security.madaidan-boot.enable = true;

  evan.services.pipewire.enable = true;
  evan.services.bluetooth.enable = true;
  evan.services.mullvad.enable = true;
  evan.services.trezord.enable = true;

  evan.windowManagers.dwl.enable = true;

  evan.programs.gnupg.enable = true;
  evan.programs.ssh.enable = true;
  evan.programs.nvf.everforest.enable = true;
  evan.programs.dconf.enable = true;

  evan.fonts.iosevka.enable = true;
  evan.fonts.noto.enable = true;

  environment.systemPackages = with pkgs; [
    texliveMedium
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
