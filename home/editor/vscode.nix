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
        url = "https://vscode.download.prss.microsoft.com/dbazure/download/insider/d4434528dd269c894c309379dbc26f48d4a3f803/code-insider-x64-1784570601.tar.gz";
        sha256 = "044fm5aafrkk7l1dm73slh8w25yin4s0y02yi9090vprjw6vilxg";
      };
      version = "latest";
    });
  };

  home.sessionPath = [
    "${config.xdg.configHome}/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
  ];
}
