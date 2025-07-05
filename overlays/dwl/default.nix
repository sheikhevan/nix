final: prev: {
  dwl = prev.dwl.overrideAttrs (oldAttrs: {
    src = ./src/dwl-v0.7;

    nativeBuildInputs =
      oldAttrs.nativeBuildInputs or []
      ++ [
        prev.pkg-config
      ];

    buildInputs =
      oldAttrs.buildInputs or []
      ++ [
        prev.wlroots
        prev.xwayland
        prev.wayland
        prev.wayland-protocols
        prev.wayland-scanner
        prev.libxkbcommon
        prev.libdrm
        prev.fcft
        prev.pixman
      ];
  });
}
