{ pkgs, ... }: {
  home.packages = with pkgs; [
    (shell-gpt.overrideAttrs (oldAttrs: {
      propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [ python3.pkgs.litellm ];
    }))
  ];

  programs.zsh.initExtraBeforeCompInit = ''
    _sgpt_zsh() {
    if [[ -n "$BUFFER" ]]; then
        _sgpt_prev_cmd=$BUFFER
        BUFFER+="⌛"
        zle -I && zle redisplay
        BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
        zle end-of-line
    fi
    }
    zle -N _sgpt_zsh
    bindkey '^[;' _sgpt_zsh
  '';
}
