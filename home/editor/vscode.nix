{ config, pkgs, ... }: {
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
        url = "https://vscode.download.prss.microsoft.com/dbazure/download/insider/38dc6ac5a771cc94bde1344722bb2d02c80096ea/code-insider-x64-1729896751.tar.gz";
        sha256 = "1jwx3rb34xh1z458j50fhlh0b74grmqx0mpzqfa9670f85m3dgkf";
      };
      version = "latest";
    });
  };

  home.sessionPath = [
    "${config.xdg.configHome}/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
  ];
}
