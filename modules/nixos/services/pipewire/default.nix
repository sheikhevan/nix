{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.services.pipewire = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'pipewire'?
        '';
      };
    };
  };
  config = mkIf config.evan.services.pipewire.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
