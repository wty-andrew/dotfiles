{ pkgs, ... }: {
  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      argcomplete
      jupyterlab
      mypy
      pip
      virtualenv
    ]))
    (poetry.withPlugins (ps: with ps; [
      poetry-plugin-up
    ]))
    ruff
    uv
  ];

  xdg.configFile."ruff".source = ../../config/ruff;
}
