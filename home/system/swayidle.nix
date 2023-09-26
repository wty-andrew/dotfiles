{ pkgs, ... }: {
  home.packages = with pkgs; [
    swayidle
    sway-audio-idle-inhibit
  ];

  services.swayidle = {
    # TODO: check if https://github.com/swaywm/sway/issues/7046 is fixed
    enable = false;

    timeouts = [
      {
        timeout = 590;
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds' -t 10000";
      }
      {
        timeout = 600;
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
    ];

    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }
    ];
  };
}
