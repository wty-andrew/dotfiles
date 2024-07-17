{ config, pkgs, ... }:
let
  pyenvRoot = "${config.home.homeDirectory}/.pyenv";
in
{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      argcomplete
      jupyter
      mypy
      pip
      virtualenv
    ]))
    (poetry.withPlugins (ps: with ps; [
      poetry-plugin-up
    ]))
    pyenv
    ruff
  ];

  home.sessionVariables = {
    PYENV_ROOT = pyenvRoot;
  };

  home.sessionPath = [
    "${pyenvRoot}/bin"
  ];

  home.file.".pyenv/plugins/pyenv-virtualenv".source = pkgs.fetchFromGitHub {
    owner = "pyenv";
    repo = "pyenv-virtualenv";
    rev = "37917069ecba16602decd3dd2c8b09121c673a41";
    sha256 = "AnHU7BSERnTWV7lTvfloptCk4flPvGGbm1GGmju4OnU=";
  };

  xdg.configFile."ruff".source = ../../config/ruff;

  programs.zsh.initExtra = ''
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  '';
}
