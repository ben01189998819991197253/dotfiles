;; ~/.emacs.d/appearance.el
;; Configuration settings for how Emacs looks in general

;; Uncomment if you are unable to see your selections when highlighting text
;; '(region ((t (:background "#d3d3d3" :distant-foreground "gtk_selection_fg_color"))))

;; Start Powerline
(require 'powerline)
(powerline-default-theme)

;; Enable line numbers
(global-linum-mode t)
