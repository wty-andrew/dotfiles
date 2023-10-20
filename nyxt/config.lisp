(in-package :nyxt-user)

(define-configuration web-buffer
  ((default-modes (append '(nyxt/vi-mode:vi-normal-mode) %slot-value%))))

(define-configuration prompt-buffer
  ((default-modes (append '(nyxt/emacs-mode:emacs-mode) %slot-value%))))

;; (define-configuration buffer
;;   ((override-map (let ((map (make-keymap "override-map")))
;;                    (define-key map
;;                      "C-space" 'noop
;;                      ;; "M-x" 'execute-command
;;                      ;; "C-n" 'nyxt/web-mode:scroll-down
;;                      ;; "C-p" 'nyxt/web-mode:scroll-up
;;                      )))))


(define-configuration nyxt/document-mode:document-mode
  ((keyscheme-map
    (define-keyscheme-map "custom" (list :import %slot-default%)
      nyxt/keyscheme:vi-normal
      '("d" nyxt/document-mode:scroll-page-down
        "C-t" 'set-url-new-buffer)))))

;; "o" 'set-url
;; "O" 'set-url-new-buffer
;; "g o" 'set-url-new-nosave-buffer
;; "R" 'reload-current-buffer
;; "r" 'reload-buffers
;; "u" 'reopen-buffer
;; "g b" 'switch-buffer
;; "[" 'switch-buffer-previous
;; "]" 'switch-buffer-next
;; "d" 'delete-buffer
;; "D" 'delete-current-buffer
;; "B" 'make-buffer-focus
;; "W" 'make-window
;; "C-w C-w" 'make-window
;; "C-w q" 'delete-current-window
;; "C-w C-q" 'delete-window
;; "y u" 'copy-url
;; "y t" 'copy-title
;; "Z Z" 'quit


; (load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
;
; (load-after-system :slynk (nyxt-init-file "slynk.lisp"))
(defmethod customize-instance ((document-buffer document-buffer) &key)
  (setf (slot-value document-buffer 'current-zoom-ratio) 1.25))
