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
    home.file.".config/mpv/mpv.conf".text = ''
      profile=high-quality

      keep-open=yes
      save-position-on-quit=yes
      cursor-autohide=100
      autocreate-playlist=same

      osc=no
      osd-level=1
      osd-bar=no

      alang=ja,jp,jpn,en,eng,de,deu,ger
      slang=en,eng,de,deu,ger

      vo=gpu-next
      gpu-api=opengl
      hwdec=no
      target-colorspace-hint=yes
      target-contrast=auto

      volume=100
      volume-max=100
      audio-file-auto=fuzzy
      audio-exclusive=yes

      demuxer-mkv-subtitle-preroll=yes
      blend-subtitles=yes
      sub-auto=fuzzy
      sub-ass-override=scale
      sub-gauss=1.0
      sub-gray=yes
    '';
  };
}
