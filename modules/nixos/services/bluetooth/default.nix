{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.services.bluetooth = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable bluetooth?
        '';
      };
    };
  };
  config = mkIf config.evan.services.bluetooth.enable {
    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;
    };
  };
}
