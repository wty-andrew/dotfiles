(set-prefix-key (kbd "C-SPC"))

(define-key *root-map* (kbd "-") "vsplit-and-focus") ; override fclear
(define-key *root-map* (kbd "|") "hsplit-and-focus")
(define-key *root-map* (kbd "/") "hsplit-and-focus")

;; applications
(define-key *root-map* (kbd "c") "chrome") ; override terminal
(define-key *root-map* (kbd "s") "slack") ; override vsplit
(define-key *root-map* (kbd "t") "wezterm")
(define-key *root-map* (kbd "v") "vscode") ; override version
(define-key *root-map* (kbd "z") "zathura")

;; gnome shortcuts
(define-key *top-map* (kbd "M-Tab") "fnext")
(define-key *top-map* (kbd "M-ISO_Left_Tab") "fprev")
(define-key *top-map* (kbd "M-F4") "delete-window")
(define-key *top-map* (kbd "C-M-t") "exec x-terminal-emulator")

;; navigation
(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-l") "move-focus right")
(define-key *top-map* (kbd "s-Tab") "windowlist")

;; window
(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-J") "move-window down")
(define-key *top-map* (kbd "s-K") "move-window up")
(define-key *top-map* (kbd "s-L") "move-window right")
(define-key *top-map* (kbd "s-Left") "exchange-direction left")
(define-key *top-map* (kbd "s-Down") "exchange-direction down")
(define-key *top-map* (kbd "s-Up") "exchange-direction up")
(define-key *top-map* (kbd "s-Right") "exchange-direction right")
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-p") "pull-hidden-previous")
(define-key *top-map* (kbd "s-R") "iresize")

;; groups
(define-key *top-map* (kbd "s-]") "gnext")
(define-key *top-map* (kbd "s-[") "gprev")
(define-key *top-map* (kbd "s-}") "gnext-with-window")
(define-key *top-map* (kbd "s-{") "gprev-with-window")
(define-key *top-map* (kbd "s-1") "select-window-by-number 1")
(define-key *top-map* (kbd "s-2") "select-window-by-number 2")
(define-key *top-map* (kbd "s-3") "select-window-by-number 3")
(define-key *top-map* (kbd "s-4") "select-window-by-number 4")
(define-key *top-map* (kbd "s-5") "select-window-by-number 5")
(define-key *top-map* (kbd "s-6") "select-window-by-number 6")
(define-key *top-map* (kbd "s-7") "select-window-by-number 7")
(define-key *top-map* (kbd "s-8") "select-window-by-number 8")
(define-key *top-map* (kbd "s-9") "select-window-by-number 9")
(define-key *top-map* (kbd "s-0") "select-window-by-number 0")
(define-key *top-map* (kbd "s-!") "gselect 1")
(define-key *top-map* (kbd "s-@") "gselect 2")
(define-key *top-map* (kbd "s-#") "gselect 3")
(define-key *top-map* (kbd "s-$") "gselect 4")
(define-key *top-map* (kbd "s-%") "gselect 5")
(define-key *top-map* (kbd "s-^") "gselect 6")
(define-key *top-map* (kbd "s-&") "gselect 7")
(define-key *top-map* (kbd "s-*") "gselect 8")
(define-key *top-map* (kbd "s-(") "gselect 9")
(define-key *top-map* (kbd "s-)") "gselect 0")

;; frames
(define-key *top-map* (kbd "s--") "vsplit-and-focus")
(define-key *top-map* (kbd "s-|") "hsplit-and-focus")
(define-key *top-map* (kbd "s-/") "hsplit-and-focus")
(define-key *top-map* (kbd "s-r") "remove-split")

;; misc
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-y") "mode-line")
(define-key *top-map* (kbd "s-f") "fullscreen")

(define-key *top-map* (kbd "XF86AudioRaiseVolume") "volume-up")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "volume-down")
(define-key *top-map* (kbd "XF86AudioMute") "volume-toggle-mute")
