{ pkgs, ... }: {
  home.packages = with pkgs; [
    terraform
    terragrunt
  ];

  programs.zsh.initContent = ''
    complete -o nospace -C ${pkgs.terragrunt}/bin/terragrunt terragrunt
  '';
}
