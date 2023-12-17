{ inputs, config, pkgs, username, ... }:

{
  imports = [
    ./ags
    ./editorconfig
    ./git
    ./starship
    ./tmux
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
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bat
    diff-so-fancy
    exa
    fzf
    jq
    lsd
    neofetch
    ranger
    ripgrep
    tree
    zoxide
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/andrew/dotfiles/home-manager/config/hypr";

    ".config/wezterm" = {
      source = ./config/wezterm;
      recursive = true;
    };
    # ".config/wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "/home/andrew/dotfiles/home-manager/config/wezterm/wezterm.lua";

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Andrew";
    userEmail = "wty.andrew@gmail.com";
  };

  programs.wezterm = {
    enable = true;
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
    ];
  };
}
