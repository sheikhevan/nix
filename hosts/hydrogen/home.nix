{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/homeManager/programs/git
    ../../modules/homeManager/programs/foot
    ../../modules/homeManager/programs/zathura
    ../../modules/homeManager/programs/mpv
    ../../modules/homeManager/programs/newsboat
    ../../modules/homeManager/theme/gtk
    ../../modules/homeManager/xdg
  ];
  home.username = "evan";
  home.homeDirectory = "/home/evan";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  home.packages = with pkgs; [
    fastfetch

    mullvad-vpn

    wget
    yt-dlp
    ffmpeg
    mutagen
    tidal-dl
    transmission_4-gtk
    libnatpmp

    zip
    xz
    unzip
    p7zip

    ripgrep
    jq
    yq-go
    eza
    fzf
    fcp

    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd

    strace
    ltrace
    lsof

    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
    vulkan-tools
    acpi

    nodejs
    bun

    yazi

    obsidian

    inputs.zen-browser.packages.${system}.beta
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  evan.programs.git.enable = true;
  evan.programs.foot.everforest.enable = true;
  evan.programs.mpv.enable = true;
  evan.programs.zathura.everforest.enable = true;
  evan.programs.newsboat.enable = true;

  evan.gtk.everforest.enable = true;

  evan.xdg.lowercaseDirs.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
