{ pkgs, username, ... }: {
  programs.ssh.startAgent = true;

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "${username}" ];
    };
  };

  environment.systemPackages = with pkgs; [
    openssl
  ];
}
