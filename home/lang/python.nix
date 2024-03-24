{ config, pkgs, ... }:
let
  pyenvRoot = "${config.home.homeDirectory}/.pyenv";
in
{
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      pip
      virtualenv
      jupyter
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

  home.file = {
    ".pyenv/plugins/pyenv-virtualenv".source = pkgs.fetchFromGitHub {
      owner = "pyenv";
      repo = "pyenv-virtualenv";
      rev = "0f83c33a3b8d73550567b6479fedf4d3cdf1ae76";
      sha256 = "BsKNVLVqJarYu6QoPK0lTzBvDwqYKzYj09CddyQ2jrU=";
    };

    ".config/ruff".source = ../../config/ruff;
  };

  programs.zsh.initExtra = ''
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  '';
}
