(load-module "ttf-fonts")
(setf xft:*font-dirs* '("~/dotfiles/stumpwm.d/fonts/"))
(unless (xft:get-font-families)
  (xft:cache-fonts))

(set-font (make-instance 'xft:font
                         :family "DejaVuSansMono Nerd Font Mono"
                         :subfamily "Book"
                         :size 12))
