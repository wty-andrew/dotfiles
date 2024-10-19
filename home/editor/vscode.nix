{ pkgs, ... }: {
  # https://nixos.wiki/wiki/Visual_Studio_Code
  home.packages = with pkgs; [
    vscode.fhs
  ];

  # https://discourse.nixos.org/t/how-to-install-latest-vscode-insiders/7895
  programs.vscode = {
    enable = true;

    package = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: {
      src = builtins.fetchTarball {
        # redirected url from: https://update.code.visualstudio.com/latest/linux-x64/insider
        url = "https://vscode.download.prss.microsoft.com/dbazure/download/insider/63d06667600a2c40245a0ab1f9e2ea816d2fe849/code-insider-x64-1718965549.tar.gz";
        sha256 = "1fy86f000vvd4gx8mlfl1nxngk5q4m2dvcna9p1vxygjcd0n948v";
      };
      version = "latest";
    });
  };
}
