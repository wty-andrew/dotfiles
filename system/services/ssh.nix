{ pkgs, ... }: {
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    openssl
  ];
}
