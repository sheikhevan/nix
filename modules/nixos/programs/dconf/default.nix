{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.dconf = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'dconf'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.dconf.enable {
    programs.dconf.enable = true;
  };
}
