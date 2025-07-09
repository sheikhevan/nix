{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.services.trezord = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'trezord'?
        '';
      };
    };
  };
  config = mkIf config.evan.services.trezord.enable {
    services.trezord = {
      enable = true;
    };
  };
}
