{ inputs, config, pkgs, username, ... }: {
  imports = [
    ./ags
    ./blender
    ./bruno
    ./chromium
    ./editorconfig
    ./emacs
    ./firefox
    ./gcloud
    ./git
    ./hyprland
    ./keybase
    ./krita
    ./kubernetes
    ./lbry
    ./megasync
    ./neovim
    ./python
    ./rust
    ./spotify
    ./starship
    ./terraform
    ./tmux
    ./vscode
    ./wezterm
    ./zsh
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bat
    diff-so-fancy
    fd
    fzf

    zip
    unzip

    btop
    iotop
    iftop

    pciutils
    usbutils

    glib # for gsettings
    gsettings-desktop-schemas

    jq
    lsd
    neofetch
    ranger
    ripgrep
    tree
    zoxide

    nodejs_20
    nodejs_20.pkgs.pnpm
    bun

    qogir-icon-theme
    numix-icon-theme
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/andrew/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.pointerCursor = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;
    size = 18;
    x11.enable = true;
    gtk.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null;
    publicShare = null;
    templates = null;
  };

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chewing
      fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-table-extra
    ];
  };

  home.file.".local/share/fcitx5/themes/catppuccin".source =
    pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "fcitx5";
      rev = "ce244cfdf43a648d984719fdfd1d60aab09f5c97";
      sha256 = "sha256-uFaCbyrEjv4oiKUzLVFzw+UY54/h7wh2cntqeyYwGps=";
    } + "/src/catppuccin-frappe";
}
