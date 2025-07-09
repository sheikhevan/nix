final: prev: {
  slstatus = prev.slstatus.overrideAttrs (oldAttrs: {
    src = ./src/slstatus-1.1;

    nativeBuildInputs =
      oldAttrs.nativeBuildInputs or []
      ++ [
        prev.pkg-config
      ];

    buildInputs =
      oldAttrs.buildInputs or []
      ++ [
      ];
  });
}
