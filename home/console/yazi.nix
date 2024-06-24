{ inputs, config, pkgs, helpers, ... }: {
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
  };

  home.packages = with pkgs; [
    ueberzugpp
  ];

  programs.zsh.initExtra = ''
    function yz() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
  '';

  home.file.".config/yazi".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/yazi);
}
