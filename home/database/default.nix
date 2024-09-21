{ ... }: {
  imports = [
    ./minio.nix
    ./mongo.nix
    ./postgres.nix
    ./redis.nix
  ];
}
