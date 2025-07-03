{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.fonts.iosevka = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'iosevka' font with nerd symbols?
        '';
      };
    };
  };
  config = mkIf config.evan.fonts.iosevka.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
    ];
  };
}
