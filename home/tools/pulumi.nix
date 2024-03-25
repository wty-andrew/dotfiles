{ pkgs, ... }: with pkgs;
let
  addtionalPackages = [
    pulumiPackages.pulumi-language-python
    pulumiPackages.pulumi-language-nodejs
  ];
in
{
  home.packages = [
    # below is taken from `pulumi.withPackages` with added line to copy autocomplete scripts
    # TODO: figure out the right way to do this
    (runCommand "${pulumi.name}-with-packages"
      {
        nativeBuildInputs = [ makeWrapper ];
      }
      ''
        mkdir -p $out/bin
        makeWrapper ${pulumi}/bin/pulumi $out/bin/pulumi \
          --suffix PATH : ${lib.makeSearchPath "bin" addtionalPackages}

        cp -r ${pulumi}/share $out/share
      ''
    )
  ];
}
