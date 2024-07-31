{ pkgs, ... }: {
  home.packages = with pkgs; [
    terraform
    terragrunt
  ];

  programs.zsh.initExtra = ''
    complete -o nospace -C ${pkgs.terragrunt}/bin/terragrunt terragrunt
  '';
}
