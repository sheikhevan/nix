{pkgs}:
pkgs.writeShellScriptBin "screenshot-wl" ''
  exec grim -o eDP-1 ~/pictures/screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png
''
