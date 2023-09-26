set dotenv-load

profile := env_var('PROFILE')

default:
  @just -l

update-system:
  sudo nixos-rebuild switch --flake {{justfile_directory()}}#{{profile}}

update-home:
  home-manager switch --flake {{justfile_directory()}}#{{profile}}
