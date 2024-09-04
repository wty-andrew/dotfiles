{ username, pkgs, ... }: {
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_26;
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
