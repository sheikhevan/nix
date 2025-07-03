{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.services.mullvad = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'mullvad'?
        '';
      };
    };
  };
  config = mkIf config.evan.services.mullvad.enable {
    services.mullvad-vpn.enable = true;
  };
}
