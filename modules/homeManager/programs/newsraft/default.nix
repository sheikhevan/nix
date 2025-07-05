{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.newsraft = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'newsraft'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.newsraft.enable {
    home.packages = with pkgs; [
      newsraft
    ];
    home.file.".config/newsraft/feeds".text = ''
      @ News
      https://www.kxan.com/feed/ "KXAN Austin"
      https://feeds.bbci.co.uk/news/rss.xml?edition=us "BBC US"
      https://aljazeera.com/xml/rss/all.xml "Al Jazeera"
      https://news.un.org/feed/subscribe/en/news/all/rss.xml "United Nations"

      @ Weather
      http://rss.accuweather.com/rss/liveweather_rss.asp?locCode=78701 "AccuWeather Austin, TX"
      https://api.weather.gov/alerts/active.atom?point=30.266666%2C-97.733330 "NWS Alerts Austin, TX"

      @ Announcements
      https://nixos.org/blog/announcements-rss.xml "NixOS"
      https://asahilinux.org/blog/index.xml "Asahi Linux"
      https://www.getmonero.org/feed.xml "Monero"
      https://mullvad.net/en/blog/feed/atom "Mullvad VPN"

      @ Blogs
      https://krebsonsecurity.com/feed/ "Krebs on Security"
      https://n-o-d-e.net/rss/rss.xml "N O D E"
      https://www.bentasker.co.uk/rss.xml "Ben Tasker"

      @ Sports
      https://www.ufc.com/rss/news "UFC"
      https://www.tennis.com/roots/rss-feeds/news/ "Tennis"

      @ YouTube
      https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA "Luke Smith"
      https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA "Mental Outlaw"
      https://www.youtube.com/feeds/videos.xml?channel_id=UC0dbzuSRwNiZXfWK05epKUQ "Lord Miles"

      @ Misc
      https://xkcd.com/atom.xml "xkcd"
      https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss "NASA Image of The Day"
    '';
  };
}
