{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.ssh = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'ssh'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.ssh.enable {
    programs.ssh = {
      startAgent = true;
    };
  };
}
