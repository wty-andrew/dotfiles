;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "Andika")
      doom-symbol-font (font-spec :family "Symbola")
      doom-serif-font (font-spec :family "FiraCode Nerd Font")
      doom-emoji-font (font-spec :family "Noto Color Emoji"))

(add-hook! after-setting-font
           (dolist (charset '(kana han cjk-misc bopomofo))
             (set-fontset-font t charset (font-spec :family "Noto Sans CJK TC"))))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'frappe)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Keybindings
(bind-key "C-j" #'evil-window-down)
(bind-key "C-k" #'evil-window-up)
(bind-key "C-h" #'evil-window-left)
(bind-key "C-l" #'evil-window-right)
(bind-key "M-]" #'next-buffer)
(bind-key "M-[" #'next-buffer)
(bind-key "M-j" #'drag-stuff-down)
(bind-key "M-k" #'drag-stuff-up)

(map! :leader "w -" #'evil-window-split)
(map! :leader "w /" #'evil-window-vsplit)
(map! :leader "SPC" #'execute-extended-command)

;; Appearance
(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-footer )

(add-to-list 'default-frame-alist '(alpha-background . 90))

;; Treemacs
(setq treemacs-position 'right)

;; Org Mode
(after! org
  (setq org-hide-emphasis-markers t
        org-ellipsis " ▾ "
        org-fontify-done-headline nil)
  (setq org-superstar-headline-bullets-list '(?🞺 ?🞹 ?🞸 ?🞷 ?🞶)
        org-superstar-item-bullet-alist '((?- . ?•) (?+ . ?◦) (?* . ?🟉)))
  (setq org-list-demote-modify-bullet '(("-" . "+")
                                        ("+" . "-")
                                        ("1." . "-")
                                        ("1)" . "-")
                                        ("A." . "-")
                                        ("A)" . "-")))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STRT(s)" "HOLD(h)" "|" "DONE(d)" "KILL(k)")
          (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)"))
        org-todo-keyword-faces
        '(("TODO" . org-todo)
          ("STRT" . +org-todo-active)
          ("HOLD" . +org-todo-onhold)
          ("DONE" . org-done)
          ("KILL" . +org-todo-cancel)
          ("[ ]" . org-todo)
          ("[-]" . +org-todo-active)
          ("[?]" . +org-todo-onhold)
          ("[X]" . org-done))))

(custom-set-faces!
  `(org-quote :background ,(catppuccin-get-color 'mantle) :extend t)
  `(org-table :foreground ,(catppuccin-get-color 'teal))
  `(org-verbatim :foreground ,(catppuccin-get-color 'green))
  `(org-todo :foreground ,(catppuccin-get-color 'pink))
  `(+org-todo-active :foreground ,(catppuccin-get-color 'flamingo))
  `(+org-todo-cancel :foreground ,(catppuccin-get-color 'overlay2))
  `(+org-todo-onhold :foreground ,(catppuccin-get-color 'lavender))
  `(+org-todo-project :foreground ,(catppuccin-get-color 'blue))
  `(org-done :foreground ,(catppuccin-get-color 'teal)))

(defun prettify-org-symbols ()
  (setq prettify-symbols-alist '(("[ ]" . "")
                                 ("[-]" . "")
                                 ("[X]" . "")
                                 ("#+begin_src" . "")
                                 ("#+end_src" . "―")
                                 ("#+results:" . "")
                                 ("#+RESULTS:" . "")
                                 ("#+begin_quote" . "")
                                 ("#+end_quote" . ""))))

(add-hook! org-mode
           #'mixed-pitch-mode
           #'copilot-mode
           #'prettify-org-symbols
           (text-scale-increase 1))

(setq org-agenda-files (list (concat org-directory "agenda")))

;; Misc
(setq inferior-lisp-program "ros -Q run")

;; Copilot
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(setq copilot-indent-offset-warning-disable t)

;; ebuku
(add-hook! ebuku-mode
  (evil-snipe-local-mode -1))
