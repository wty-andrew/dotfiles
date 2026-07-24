{ username, config, ... }: {
  services.hermes-agent = {
    enable = true;
    environmentFiles = [ config.sops.secrets."hermes-env".path ];
    configFile = ../../config/hermes/config.yaml;
    addToSystemPackages = true;
  };

  users.users.${username}.extraGroups = [ "hermes" ];

  sops.secrets."hermes-env" = {
    format = "yaml";
    sopsFile = ./secrets/hermes.yaml;
  };
}
