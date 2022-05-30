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
(swm-gaps:toggle-gaps-on)
