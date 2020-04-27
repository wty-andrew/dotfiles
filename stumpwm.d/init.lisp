;; -*-lisp-*-

(in-package :stumpwm)

(stumpwm:run-shell-command "setxkbmap -option ctrl:nocaps")
(stumpwm:run-shell-command "xsetroot -cursor_name left_ptr")

(set-prefix-key (kbd "C-SPC"))

(setf *mouse-focus-policy* :click)

(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-L") "move-window right")
(define-key *top-map* (kbd "s-K") "move-window up")
(define-key *top-map* (kbd "s-J") "move-window down")
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-p") "pull-hidden-previous")
