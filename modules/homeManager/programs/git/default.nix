{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options = {
    evan.programs.git = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Enable 'git'?
        '';
      };
    };
  };
  config = mkIf config.evan.programs.git.enable {
    programs.git = {
      enable = true;
      userName = "Evan Alvarez";
      userEmail = "evanfalvarez@tutamail.com";
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIaV9pa7Rzk3g4LnQCLnAMQtgPd1kJJp3AV11DO/7Z6 evanfalvarez@tutamail.com";
        signByDefault = true;
      };
      extraConfig = {
        gpg = {
          format = "ssh";
        };
      };
    };
  };
}
