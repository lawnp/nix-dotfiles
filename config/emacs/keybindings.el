;; Create a prefix keymap for comma
(define-prefix-command 'comma-prefix)

;; Make "," call that prefix map
(define-key global-map (kbd ",") 'comma-prefix)


;; files
(global-set-key (kbd "C-, r") #'ranger)

;; projectile
(global-set-key (kbd "C-c p s") #'projectile-switch-project)
