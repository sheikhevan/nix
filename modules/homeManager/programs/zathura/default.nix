{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.zathura = {
      e-ink.enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'zathura' with the 'e-ink' rice?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.zathura.e-ink.enable {
    programs.zathura = {
      enable = true;
      extraConfig = ''
        set default-bg                  "#CCCCCC"
        set default-fg                  "#474747"
        set statusbar-fg                "#474747"
        set statusbar-bg                "#AEAEAE"
        set inputbar-bg                 "#AEAEAE"
        set inputbar-fg                 "#474747"
        set notification-bg             "#AEAEAE"
        set notification-fg             "#474747"
        set notification-error-bg       "#AEAEAE"
        set notification-error-fg       "#333333"
        set notification-warning-bg     "#AEAEAE"
        set notification-warning-fg     "#5E5E5E"
        set highlight-color             "#9A9A9A"
        set highlight-active-color      "#4A4A4A"
        set completion-bg               "#AEAEAE"
        set completion-fg               "#474747"
        set completion-highlight-fg     "#CCCCCC"
        set completion-highlight-bg     "#5E5E5E"
      '';
    };
  };
}
