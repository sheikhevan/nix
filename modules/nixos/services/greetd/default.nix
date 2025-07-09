{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.services.greetd = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'greetd' with autologin?
        '';
      };
    };
  };
  config = mkIf config.evan.services.greetd.enable {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "slstatus -s | ${pkgs.dwl}/bin/dwl";
          user = "evan";
        };
        default_session = initial_session;
      };
    };
  };
}
