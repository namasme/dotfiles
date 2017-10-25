;; auto-mode-alist

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

;; Recent files configuration

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(run-at-time nil (* 60 60) 'recentf-save-list)

;; enable C-x C-n

(put 'set-goal-column 'disabled nil)
