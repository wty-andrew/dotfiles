(in-package :nyxt-user)

(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))

(load-after-system :slynk (nyxt-init-file "slynk.lisp"))

(define-configuration (buffer web-buffer)
  ((default-modes (append '(vi-normal-mode) %slot-default%))))

(define-configuration (prompt-buffer)
  ((default-modes (append '(vi-insert-mode) %slot-default%))))

(define-configuration status-buffer
  ((height 30)))
