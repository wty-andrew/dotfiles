{ pkgs, ... }: {
  # https://nixos.wiki/wiki/Visual_Studio_Code
  home.packages = with pkgs; [
    unstable.vscode.fhs
  ];

  # https://discourse.nixos.org/t/how-to-install-latest-vscode-insiders/7895
  programs.vscode = {
    enable = true;

    package = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
      src = (builtins.fetchTarball {
        url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
        sha256 = "18p8yp8i696mzdhavnf8ar3dkq2cdwv6gckzwvrn2bd8bg49ywsw";
      });
      version = "latest";
    });
  };
}
