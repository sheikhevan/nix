{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.gtk = {
      everforest.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable gtk with the everforest theme? (note: currently I am just using adwaita-dark)
        '';
      };
    };
  };
  config = mkIf config.evan.gtk.everforest.enable {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 32;
      };
      font = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
        size = 10;
      };
      theme = {
        package = pkgs.gnome-themes-extra;
        name = "Adwaita-dark";
      };
    };
  };
}
