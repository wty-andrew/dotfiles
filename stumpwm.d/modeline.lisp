(ql:quickload :alexandria)
(load-module "cpu")
(load-module "mem")

(setf *mode-line-timeout* 5
      *mode-line-border-width* 0
      *mode-line-pad-x* 12
      *mode-line-pad-y* 3
      *mode-line-background-color* "#011f26"
      *mode-line-foreground-color* "#f2a71b"
      *mode-line-border-color* "#011f26")

(setf cpu::*cpu-modeline-fmt* "%c"
      cpu::*cpu-usage-modeline-fmt* "^[~a~1D%^]"
      mem::*mem-modeline-fmt* "%a")

(setf *group-format* " %n "
      *window-format* "%m%n)%c"
      *time-modeline-string* "%b %e %H:%M"
      *mode-line-highlight-template* "^R~A^r"
      *screen-mode-line-format* (list "%g   "
                                      "%w"
                                      "^>"
                                      "CPU: %C   "
                                      "MEM: %M   "
                                      "[%d]   "
                                      "^>%T"))

(defun enable-mode-lines ()
  "Enable mode lines on the current screen."
  (loop for head in (screen-heads (current-screen))
        do (enable-mode-line (current-screen) head t)))

(ql:quickload :xembed)
(load-module "stumptray")
;; (enable-mode-lines)
;; (run-commands "stumptray")
;; (stumptray:stumptray)
