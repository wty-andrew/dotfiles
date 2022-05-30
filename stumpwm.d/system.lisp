(run-shell-command "setxkbmap -option ctrl:nocaps")
(run-shell-command "xsetroot -cursor_name left_ptr")

;; fix scrolling in GTK3
(setf (getenv "GDK_CORE_DEVICE_EVENTS") "1")

;; slynk
(ql:quickload :slynk)

(defparameter *slynk-port* 4004
  "The default port for slynk")

(defvar *slynk-server-p* nil
  "Is slynk server running?")

(defcommand start-slynk () ()
  "Start slynk server if it is not already running"
  (unless *slynk-server-p*
    (slynk:create-server :port *slynk-port*
                         :dont-close t)
    (setf *slynk-server-p* t)))

(defcommand stop-slynk () ()
  "Stop slynk server"
  (when *slynk-server-p*
    (slynk:stop-server *slynk-port*)
    (setf *slynk-server-p* nil)))

;; volume control
(defcommand volume-up () ()
  (run-shell-command "pactl set-sink-volume @DEFAULT_SINK@ +5%"))

(defcommand volume-down () ()
  (run-shell-command "pactl set-sink-volume @DEFAULT_SINK@ -5%"))

(defcommand volume-toggle-mute() ()
  (run-shell-command "pactl set-sink-mute @DEFAULT_SINK@ toggle"))
