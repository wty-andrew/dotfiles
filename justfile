set dotenv-load

profile := env_var('PROFILE')

[private]
default:
  @just --list --unsorted

update-system:
  sudo nixos-rebuild switch --flake .#{{profile}}

update-home:
  home-manager switch --flake .#{{profile}}

list-system:
  nixos-rebuild list-generations

list-home:
  home-manager generations
