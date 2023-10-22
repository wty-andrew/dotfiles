(defun program-running-p (program)
  "Check if program is already running."
  (zerop (nth-value 2 (uiop:run-program (format nil "pgrep ~a" program) :ignore-error-status t))))

(defcommand calibre () ()
  "Start Calibre or switch to it."
  (run-or-raise "calibre" '(:class "calibre")))

(defcommand chrome () ()
  "Start Chrome or switch to it." ;; https://github.com/stumpwm/stumpwm/issues/894
  (run-or-raise "google-chrome --force-device-scale-factor=1.25" '(:class "Google-chrome")))

(defcommand vscode () ()
  "Start VSCode or switch to it."
  (run-or-raise "code" '(:class "Code")))

(defcommand slack () ()
  "Start Slack or switch to it."
  (run-or-raise "slack" '(:class "slack")))

(defcommand wezterm () ()
  "Start wezterm or switch to it."
  (run-or-raise "wezterm" '(:class "wezterm")))

(defcommand zathura () ()
  "Start Zathura or switch to it."
  (run-or-raise "zathura" '(:class "Zathura")))

(defcommand screenshot () ()
  (run-shell-command "flameshot screen -p ~/Pictures/Screenshots"))

(defcommand dropbox () ()
  "Start Dropbox if it is not already running."
  (unless (program-running-p "dropbox")
    (run-shell-command (uiop:native-namestring "~/.dropbox-dist/dropboxd"))))

(defcommand megasync () ()
  "Start MEGAsync if it is not already running."
  (unless (program-running-p "megasync")
    (run-shell-command "megasync")))

(defcommand keybase () ()
  "Start Keybase if it is not already running."
  (unless (program-running-p "keybase")
    (run-shell-command "run_keybase")))

(defcommand lbry () ()
  "Start LBRY if it is not already running."
  (unless (program-running-p "lbry")
    (run-shell-command "lbry")))

(defcommand polybar () ()
  "Start polybar with temporary hack to reserve space on top of screen."
  (let ((origin-gaps-state swm-gaps:*gaps-on*))
    (swm-gaps:toggle-gaps-off)
    (let* ((head (find-head-by-position (current-screen) 0 0))
           (head-number (head-number head))
           (size 40)
           (x (head-x head))
           (y (head-y head))
           (width (head-width head))
           (height (head-height head)))
      (run-shell-command "polybar-msg cmd quit")
      (run-shell-command "polybar main")
      (resize-head head-number x (+ y size) width (- height size))
      (when origin-gaps-state
        (swm-gaps:toggle-gaps-on)))))
