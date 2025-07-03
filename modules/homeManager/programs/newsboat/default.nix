{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.newsboat = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'newsboat'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.newsboat.enable {
    programs.newsboat = {
      enable = true;
      urls = [
        {
          title = "NixOS Announcements";
          tags = [
            "Linux"
          ];
          url = "https://nixos.org/blog/announcements-rss.xml";
        }
        {
          title = "NixOS Newsletters";
          tags = [
            "Linux"
          ];
          url = "https://nixos.org/blog/newsletters-rss.xml";
        }
        {
          title = "Luke Smith";
          tags = [
            "YouTube"
          ];
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
        }
      ];
    };
  };
}
