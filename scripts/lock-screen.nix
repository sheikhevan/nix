{pkgs}:
pkgs.writeShellScriptBin "lock-screen" ''
  exec waylock -init-color 0x2b3339 -input-color 0xa7c080 -fail-color 0xe67e80
''
