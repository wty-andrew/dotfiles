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

;; frame control
(defcommand fprev () ()
  "Cycle through the frame tree to the previous frame."
  (focus-prev-frame (current-group)))

(defcommand hsplit-and-focus () ()
  "Run hsplit and focus the new frame."
  (hsplit)
  (move-focus :right))

(defcommand vsplit-and-focus () ()
  "Run vsplit and focus the new frame."
  (vsplit)
  (move-focus :down))

;;; UI/UX
(setf *mouse-focus-policy* :sloppy)
(setf *resize-increment* 25)

(set-border-color "#f72f33")
(set-focus-color "#fabd2f")

(set-msg-border-width 3)

(setf *input-window-gravity* :center
      *message-window-gravity* :center
      *message-window-padding* 10
      *window-border-style* :thin)

(load-module "swm-gaps")
(setf swm-gaps:*inner-gaps-size* 6
      swm-gaps:*outer-gaps-size* 8)

