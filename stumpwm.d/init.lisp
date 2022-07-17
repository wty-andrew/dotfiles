(in-package :stumpwm)

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

(defun load-config (path)
  (let ((file (merge-pathnames path (uiop:native-namestring "~/dotfiles/stumpwm.d/"))))
    (if (probe-file file)
        (load file)
        (error (format nil "Cannot load \"~a\": file not found" file)))))

(load-config "system.lisp")
(load-config "application.lisp")
(load-config "keybindings.lisp")
(load-config "font.lisp")
(load-config "modeline.lisp")

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

;; https://github.com/lepisma/stumpwm-contrib/commit/08918d79fb33c20a04b86e5ac99f37f573c5a52f
(load-module "swm-gaps")
(setf swm-gaps:*inner-gaps-size* 6
      swm-gaps:*outer-gaps-size* 8)
;; (swm-gaps:toggle-gaps-on)

(defcommand polybar () ()
  "Start polybar with temporary hack to reserve space on top of screen."
  (let ((origin-gaps-state swm-gaps:*gaps-on*))
    (swm-gaps:toggle-gaps-off)
    (let* ((head-number 0)
           (size 30)
           (head (head-by-number (current-screen) head-number))
           (x (head-x head))
           (y (head-y head))
           (width (head-width head))
           (height (head-height head)))
      (run-shell-command "feh --bg-fill ~/dotfiles/wallpapers/yosemite.png")
      (run-shell-command "polybar-msg cmd quit")
      (run-shell-command "polybar main")
      (resize-head head-number x (+ y size) width (- height size))
      (when origin-gaps-state
        (swm-gaps:toggle-gaps-on)))))
