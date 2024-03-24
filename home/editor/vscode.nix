{ pkgs, ... }: {
  # https://nixos.wiki/wiki/Visual_Studio_Code
  home.packages = with pkgs; [
    vscode.fhs
  ];

  # https://discourse.nixos.org/t/how-to-install-latest-vscode-insiders/7895
  programs.vscode = {
    enable = true;

    package = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: {
      src = (builtins.fetchTarball {
        # redirected url from: https://update.code.visualstudio.com/latest/linux-x64/insider
        url = "https://vscode.download.prss.microsoft.com/dbazure/download/insider/c11a2dd4d52e38cb92b8c464f47a7b02bb7c8762/code-insider-x64-1708733796.tar.gz";
        sha256 = "0if696r9hpmdc05pr7bn0rh2np3ia3pqf4ljvrx5d51yafl558jn";
      });
      version = "latest";
    });
  };
}
