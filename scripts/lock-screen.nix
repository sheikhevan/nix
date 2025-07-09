{pkgs}:
pkgs.writeShellScriptBin "lock-screen" ''
  exec waylock -init-color 0xCCCCCC -input-color 0x868686 -fail-color 0x333333
''
