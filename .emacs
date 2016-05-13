;;; Packages
(require 'package)
;;  Add package archives
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;  Initialise package manager
(package-initialize)


;;; C++ editing modes
;;  Evil Mode >:)
(package-install 'evil)
(require 'evil)
(evil-mode 1)

;;  RTags
;(package-install 'rtags)
;(require 'rtags)
;(setq rtags-autostart-diagnostics t)
;(rtags-diagnostics)
;(rtags-enable-standard-keybindings)

;;  Auto completion
(package-install 'company)
(require 'company)
(setq company-idle-delay 0)
;(push '(company-rtags company-clang) company-backends)
(global-company-mode)

;;  Get tags from cmake
;;(require 'cmake-ide)
;;(cmake-ide-setup)
;;  ?!?!?! CMake IDE breaks clang for some reason

;;  Syntax checking
(package-install 'flycheck)
(require 'flycheck)
(global-flycheck-mode)

;; Disable nagging about formatting for elisp
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;;  Powerline
(package-install 'powerline)
(require 'powerline)
(powerline-center-evil-theme)


;;; Theming
;;  Load base16 theme
(load-theme 'base16-default-dark t)

;;  Clear background
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)


;;; Editor settings
;;  Frame dimensions
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 85))
(add-to-list 'initial-frame-alist '(height . 48))
(add-to-list 'initial-frame-alist '(width . 85))
;;  Tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default c-basic-offset tab-width)
;; Line numbers
(global-linum-mode t)
(setq linum-format "%4d")
;; Column width
(setq-default fill-column 80)
;; Disable toolbar
(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-clang-include-path
   (quote
    ("/usr/lib/gtk-3.0 /etc/gtk-3.0 /usr/include/gtk-3.0 /usr/share/gtk-3.0     ")))
 '(flycheck-gcc-include-path
   (quote
    ("/usr/lib/gtk-3.0 /etc/gtk-3.0 /usr/include/gtk-3.0 /usr/share/gtk-3.0")))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
