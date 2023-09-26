{ pkgs, ... }: {
  home.packages = with pkgs.unstable; [
    (google-cloud-sdk.withExtraComponents(
      [ google-cloud-sdk.components.gke-gcloud-auth-plugin ]
    ))
  ];
}
