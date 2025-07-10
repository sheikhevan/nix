{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.windowManagers.dwl = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'dwl'?
        '';
      };
    };
  };
  config = mkIf config.evan.windowManagers.dwl.enable {
    nixpkgs.overlays = [
      (import ../../../../overlays/dwl)
    ];

    environment.systemPackages = with pkgs; [
      dwl
      swayidle
      wmenu
      wbg
      brightnessctl
      waylock
      grim
      slurp
      (import ../../../../scripts/lock-screen.nix {inherit pkgs;})
      (import ../../../../scripts/wpctl-get-volume-human.nix {inherit pkgs;})
      (import ../../../../scripts/screenshot-wl.nix {inherit pkgs;})
    ];

    security.pam.services.waylock = {};

    xdg.portal = {
      wlr.enable = true;
      config = {
        common = {
          default = [
            "wlr"
          ];
        };
      };
    };
  };
}
