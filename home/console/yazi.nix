{ config, pkgs, helpers, ... }: {
  programs.yazi = {
    enable = true;
  };

  home.packages = with pkgs; [
    ouch
    ueberzugpp
  ];

  programs.zsh.initContent = ''
    function yz() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
  '';

  xdg.configFile."yazi".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/yazi);
}
