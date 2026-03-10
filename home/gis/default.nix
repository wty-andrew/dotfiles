{ ... }: {
  imports = [
    ./gdal.nix
    ./pmtiles.nix
    ./qgis.nix
    # ./tilemaker.nix # TODO: currently broken
    ./tippecanoe.nix
  ];
}
