(in-package :stumpwm)

(defun load-config (path)
  (let ((file (merge-pathnames path (uiop:native-namestring "~/dotfiles/stumpwm.d/"))))
    (if (probe-file file)
        (load file)
        (error (format nil "Cannot load \"~a\": file not found" file)))))

(load-config "system.lisp")
(load-config "application.lisp")
(load-config "keybindings.lisp")
(load-config "font.lisp")

(run-shell-command "setxkbmap -option ctrl:nocaps")
(run-shell-command "xsetroot -cursor_name left_ptr")
(run-shell-command "picom")
(run-shell-command "feh --bg-fill ~/dotfiles/wallpapers/yosemite.png")

;; fix scrolling in GTK3
(setf (getenv "GDK_CORE_DEVICE_EVENTS") "1")
