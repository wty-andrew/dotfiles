_: {
  imports = [
    ../base/home.nix

    ../../home/ai
    ../../home/browser
    ../../home/capture
    ../../home/cloud
    ../../home/console
    ../../home/creative
    ../../home/database
    ../../home/devops
    ../../home/document
    ../../home/editor
    ../../home/embedded
    ../../home/game
    ../../home/gis
    ../../home/lang
    ../../home/media
    ../../home/messenger
    ../../home/organizer
    ../../home/security
    ../../home/system
    ../../home/terminal
    ../../home/tools
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
