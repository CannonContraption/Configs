;; init.el
;;
;; Jim Read's init.el file
;; Written over a span of years, starting sometime in mid-2017.

;; Just so we have all the load dirs...
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; This file got really big within the first year+ or so, so some bits of the
;; file were spun off into sub-files, and given named features to enable. so for
;; example, customizations to C-mode and LaTeX handling are in
;; lang-mode-customizations, but since I'm a heavy org-mode user, that has its
;; own file.
(require 'org-customizations-file)
(require 'lang-mode-customizations)

(require 'package)
(add-to-list
 'package-archives
 '("melpa-stable" . "http://melpa.org/packages/")
 t)

;; This is just the 80-column enforcement code. It makes sure that code gets
;; column-aligned properly.
;(require 'column-enforce-mode)
;(global-column-enforce-mode t)

(require 'column-marker)
(defface column-marker-4 '((t (:background "RoyalBlue4")))
  "Warning face"
  :group 'faces)
(defface column-marker-5 '((t (:background "DarkGoldenRod4")))
  "End of 80 face"
  :group 'faces)
(defface column-marker-6 '((t (:background "firebrick4")))
  "Past 80 facee"
  :group 'faces)
(defvar column-marker-4-face 'column-marker-4
  "Face for column 1")
(defvar column-marker-5-face 'column-marker-5
  "Also a face for column 1")
(defvar column-marker-6-face 'column-marker-6
  "Column 1 now has three faces... or something")
(column-marker-create column-marker-4 column-marker-4-face)
(column-marker-create column-marker-5 column-marker-5-face)
(column-marker-create column-marker-6 column-marker-6-face)
(defun setMarkers () "Sets the appropriate column markers" (interactive "")
  (column-marker-4 70)
  (column-marker-5 80)
  (column-marker-6 81))
(global-set-key (kbd "C-c m") 'setMarkers)


;; And I use multiple cursors a lot, I mean a *LOT*, so here that is
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "<print>") 'ps-print-buffer)

;; I like window transparency. Therefore, here it is:
(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

;; And I'm partial to dark themes, so here's a really quality one that comes
;; with Emacs already (convienient!)
(load-theme 'wombat)

;; The toolbar and menubar just get in my way. Therefore they are removed. So is
;; the scrollbar. So is the startup screen.
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-scroll-bar-mode nil)

;; Now some default behaviors...
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;; And I was lazy and used the default font picker. It means the config file is
;; much larger than it realistically needs to be, but at least I got the font I
;; wanted here, so whatever.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "CTDB" :slant normal :weight normal :height 90 :width normal)))))

;; Not all my laptops have a system bell (grumble grumble)
;; So I've stolen the Win2k sounds, we'll use those instead.
;(setq ring-bell-function
;      (lambda ()
;        (call-process
;         "aplay"
;         nil
;         0
;         nil
;         "/home/jim/Documents/etc/Sounds/w2k/chord.wav")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(c-tab-always-indent (quote other))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(frame-resize-pixelwise t)
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (mines gdscript-mode auto-complete auctex-latexmk jdee js2-mode web-mode solarized-theme rust-mode powerline multiple-cursors evil column-marker column-enforce-mode auctex)))
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))
