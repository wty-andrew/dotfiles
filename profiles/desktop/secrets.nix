{ config, username, ... }:
let
  inherit (config.users.users.${username}) home;
in
{
  sops = {
    age = {
      keyFile = "${home}/.config/sops/age/keys.txt";
      sshKeyPaths = [ "${home}/.ssh/id_ed25519" ];
    };
  };
}
