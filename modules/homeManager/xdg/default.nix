{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.xdg = {
      lowercaseDirs.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable lowercase xdg directories?
        '';
      };
    };
  };
  config = mkIf config.evan.xdg.lowercaseDirs.enable {
    xdg.userDirs = {
      enable = true;
      desktop = "\${HOME}/desktop";
      documents = "\${HOME}/documents";
      download = "\${HOME}/downloads";
      music = "\${HOME}/music";
      pictures = "\${HOME}/pictures";
      videos = "\${HOME}/videos";
      publicShare = "\${HOME}/public";
      templates = "\{HOME}/documents/templates";
    };
  };
}
