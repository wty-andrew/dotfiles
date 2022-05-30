(defcommand alacritty () ()
  "Start alacritty or switch to it."
  (run-or-raise "alacritty" '(:class "Alacritty")))

(defcommand calibre () ()
  "Start Calibre or switch to it."
  (run-or-raise "calibre" '(:class "calibre")))

(defcommand chrome () ()
  "Start Chrome or switch to it." ;; https://github.com/stumpwm/stumpwm/issues/894
  (run-or-raise "google-chrome --force-device-scale-factor=1.25 --disable-features=SendMouseLeaveEvents" '(:class "Google-chrome")))

(defcommand vscode () ()
  "Start VSCode or switch to it."
  (run-or-raise "code --disable-features=SendMouseLeaveEvents" '(:class "Code")))

(defcommand slack () ()
  "Start Slack or switch to it."
  (run-or-raise "slack" '(:class "slack")))

(defcommand zathura () ()
  "Start Zathura or switch to it."
  (run-or-raise "zathura" '(:class "Zathura")))

(defcommand screenshot () ()
  (run-shell-command "flameshot screen -p ~/Pictures/Screenshots"))
