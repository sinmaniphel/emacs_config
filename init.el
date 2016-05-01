;; /This/ file (~init.el~) that you are reading
;; should be in this folder
;;(add-to-list 'load-path "~/.emacs.d/")

;; Package Manager
;; See ~Cask~ file for its configuration
;; https://github.com/cask/cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Keeps ~Cask~ file in sync with the packages
;; that you install/uninstall via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)

;; Root directory
(setq root-dir (file-name-directory
                (or (buffer-file-name) load-file-name)))


;; Path
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Git
(require 'magit)
(eval-after-load 'magit
  (progn '(global-set-key (kbd "C-x g") 'magit-status)))

;; flx-ido completion system, recommended by Projectile
(require 'flx-ido)
(flx-ido-mode 1)
;; change it if you have a fast processor.
(setq flx-ido-threshhold 1000)

;; Project management
(require 'ack-and-a-half)
(require 'projectile)
(projectile-global-mode)

;; Snippets
;; https://github.com/capitaomorte/yasnippet
(require 'yasnippet)
(yas-load-directory (concat root-dir "snippets"))
(yas-global-mode 1)


;; Python editing
(require 'elpy)
(elpy-enable)
(elpy-use-ipython)

;; Python check and lint
(require 'python-pep8)
(require 'python-pylint)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; Interactive do thing (ido)
(require 'ido)
(ido-mode t)

;; ---------------------------------
;; Look and feel
;; ---------------------------------
;; Theme
(load-theme 'aurora t)
;(set-cursor-color "firebrick")


;; Don't show startup screen
(setq inhibit-startup-screen t)

;; Start full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Show keystrokes
(setq echo-keystrokes 0.02)

; don't show the menu bar
(menu-bar-mode -1)
; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode -1)

; display line numbers to the right of the window
(global-linum-mode t)
; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)

;; Parenthesis management
(require 'paren)
(show-paren-mode t)

