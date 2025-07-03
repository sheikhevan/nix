{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.fonts.noto = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'noto'?
        '';
      };
    };
  };
  config = mkIf config.evan.fonts.noto.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };
}
