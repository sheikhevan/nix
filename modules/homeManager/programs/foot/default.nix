{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.foot = {
      everforest.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'foot' with the 'everforest' rice?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.foot.everforest.enable {
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
          background = "2b3339";
          foreground = "d3c6aa";

          regular0 = "4b565c";
          regular1 = "e67e80";
          regular2 = "a7c080";
          regular3 = "dbbc7f";
          regular4 = "7fbbb3";
          regular5 = "d699b6";
          regular6 = "83c092";
          regular7 = "d3c6aa";

          bright0 = "4b565c";
          bright1 = "e67e80";
          bright2 = "a7c080";
          bright3 = "dbbc7f";
          bright4 = "7fbbb3";
          bright5 = "d699b6";
          bright6 = "83c092";
          bright7 = "d3c6aa";
        };
      };
    };
  };
}
