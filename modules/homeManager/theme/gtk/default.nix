{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.gtk = {
      e-ink.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable gtk with the e-ink theme? (note: currently I am just using adwaita-light)
        '';
      };
    };
  };
  config = mkIf config.evan.gtk.e-ink.enable {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-light";
        };
      };
    };
    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
        size = 24;
      };
      font = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
        size = 10;
      };
      theme = {
        package = pkgs.gnome-themes-extra;
        name = "Adwaita-light";
      };
    };
  };
}
