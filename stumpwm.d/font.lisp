(load-module "ttf-fonts")
(setf xft:*font-dirs* '("~/dotfiles/fonts/"))
(unless (xft:get-font-families)
  (xft:cache-fonts))

(set-font (make-instance 'xft:font
                         :family "Sarasa Mono SC Nerd"
                         :subfamily "Regular"
                         :size 14))
