{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.foot = {
      e-ink.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'foot' with the 'e-ink' rice?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.foot.e-ink.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "IosevkaTerm NF:size=16";
          pad = "10x10";
        };
        mouse = {
          hide-when-typing = "yes";
        };
        colors = {
          alpha = "1.0";
          background = "CCCCCC";
          foreground = "474747";
          selection-background = "AEAEAE";
          selection-foreground = "474747";

          regular0 = "CCCCCC";
          regular1 = "333333";
          regular2 = "9A9A9A";
          regular3 = "868686";
          regular4 = "727272";
          regular5 = "AEAEAE";
          regular6 = "4A4A4A";
          regular7 = "5E5E5E";

          bright0 = "5E5E5E";
          bright1 = "333333";
          bright2 = "9A9A9A";
          bright3 = "868686";
          bright4 = "727272";
          bright5 = "AEAEAE";
          bright6 = "4A4A4A";
          bright7 = "7C7C7C";
        };
      };
    };
  };
}
