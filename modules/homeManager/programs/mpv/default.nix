{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.mpv = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'mpv'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.mpv.enable {
    programs.mpv = {
      enable = true;

      package = (
        pkgs.mpv-unwrapped.wrapper {
          scripts = with pkgs.mpvScripts; [
            uosc
            thumbfast
            sponsorblock-minimal
            quality-menu
          ];

          mpv = pkgs.mpv-unwrapped.override {
            waylandSupport = true;
          };
        }
      );
    };
  };
}
