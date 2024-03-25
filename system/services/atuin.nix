{ ... }: {
  services.atuin = {
    enable = true;
    openRegistration = true;
  };

  services.postgresql = {
    # allow local connection through unix socket
    authentication = ''
      local atuin atuin trust
    '';
  };
}
