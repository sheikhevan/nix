{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.slstatus = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'slstatus'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.slstatus.enable {
    nixpkgs.overlays = [
      (import ../../../../overlays/slstatus)
    ];

    environment.systemPackages = with pkgs; [
      slstatus
    ];
  };
}
