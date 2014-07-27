;-*-Lisp-*-
;start emacs server
;(server-start)

(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/site/")

;; Emacs should always ask for confirmation on exit
;;(setq confirm-kill-emacs 'yes-or-no-p)

;; disable iconification bindings
(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")

; basic stuff
(setq minibuffer-max-depth nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-master t)
 '(TeX-view-program-list nil)
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Evince") (output-html "xdg-open"))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/emacs-file-backups"))))
 '(c-basic-offset (quote set-from-style))
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(compile-command "make ")
 '(delete-old-versions t)
 '(desktop-save-mode nil)
 '(diary-file "~/.emacs.d/diary")
 '(ecb-tip-of-the-day nil)
 '(gdb-many-windows t)
 '(gnuserv-program (concat exec-directory "/gnuserv") t)
 '(gud-tooltip-mode t)
 '(ido-default-buffer-method (quote samewindow))
 '(ido-default-file-method (quote samewindow))
 '(ispell-local-dictionary "american")
 '(ispell-program-name "aspell")
 '(js-indent-level 2)
 '(kept-new-versions 3)
 '(kept-old-versions 3)
 '(line-number-mode t)
 '(load-home-init-file t t)
 '(mark-diary-entries-in-calendar t)
 '(next-line-add-newlines nil)
 '(paren-mode (quote paren) nil (paren))
 '(pc-select-meta-moves-sexps t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t nil (pc-select))
 '(standard-indent 2)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(version-control t)
 '(view-diary-entries-initially t)
 '(whitespace-check-leading-whitespace nil)
 '(whitespace-modes (quote (ada-mode asm-mode autoconf-mode awk-mode c-mode c++-mode cc-mode change-log-mode cperl-mode electric-nroff-mode emacs-lisp-mode f90-mode fortran-mode html-mode html3-mode java-mode jde-mode ksh-mode nil LaTeX-mode lisp-mode m4-mode makefile-mode modula-2-mode nroff-mode objc-mode pascal-mode perl-mode prolog-mode python-mode scheme-mode sgml-mode sh-mode shell-script-mode simula-mode tcl-mode tex-mode texinfo-mode vrml-mode xml-mode))))


(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))


(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode    "cc-mode" "C Editing Mode"   t)
(autoload 'objc-mode "cc-mode" "Objective C Editing Mode" t)
(autoload 'text-mode "indented-text-mode" "Indented Text Editing Mode" t)
(autoload 'xrdb-mode "xrdb-mode" "Mode for editing X resource files" t)

; prolog
(setq auto-mode-alist
  (cons (cons "\\.pl" 'prolog-mode)
     auto-mode-alist))


(setq auto-mode-alist
      (append '(("\\.C$"       . c++-mode)
                ("\\.cc$"      . c++-mode)
                ("\\.c$"       . c-mode)
                ("\\.h$"       . c++-mode)
                ("\\.i$"       . c++-mode)
                ("\\.ii$"      . c++-mode)
                ("\\.m$"       . objc-mode)
                ("\\.pl$"      . prolog-mode)
                ("\\.sql$"     . c-mode)
                ("\\.sh$"      . shell-script-mode)
                ("\\.mak$"     . makefile-mode)
                ("\\.GNU$"     . makefile-mode)
                ("makefile$"   . makefile-mode)
                ("Makefile$"   . makefile-mode)
                ("Imakefile$"  . makefile-mode)
                ("\\.Xdefaults$"    . xrdb-mode)
                ("\\.Xenvironment$" . xrdb-mode)
                ("\\.Xresources$"   . xrdb-mode)
                ("*.\\.ad$"         . xrdb-mode)
                ("\\.[eE]?[pP][sS]$" . ps-mode)
                ("\\.nsp"      . lisp-mode)
                ("\\.asd"      . lisp-mode)
                ("\\.vimpulse" . lisp-mode)
                ("\\.cl$"      . lisp-mode)
                ("\\.launch"   . xml-mode)
                ) auto-mode-alist))

;;
(setq default-tab-width 2)
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(setq scroll-step 1)
(setq scroll-conservatively 5)
(global-font-lock-mode t)               ;colorize all buffers
(setq-default indent-tabs-mode nil)

;; Search highlighting
;; highlight during query
(setq query-replace-highlight t)
;; highlight incremental search
(setq search-highlight t)

;;(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)


;; Load auctex
(load "auctex")

;; Flyspell mode
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
;;(dolist (hook '(lisp-mode-hook c++-mode-hook python-mode-hook))
;;  (add-hook hook (lambda () (flyspell-prog-mode))))

;; Set ispell default dictionary
(ispell-change-dictionary "american")

; color scheme
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-gray30)
;;(color-theme-hober)

(require 'color-theme)
(setq color-theme-load-all-themes nil)
(add-to-list 'load-path "~/.emacs.d/tango")

(require 'color-theme-tangotango)

;; select theme - first list element is for windowing system, second is for console/terminal
;; Source : http://www.emacswiki.org/emacs/ColorTheme#toc9
(setq color-theme-choices 
      '(color-theme-tangotango color-theme-tangotango))

;; default-start
(funcall (lambda (cols)
    	   (let ((color-theme-is-global nil))
    	     (eval 
    	      (append '(if (window-system))
    		      (mapcar (lambda (x) (cons x nil)) 
    			      cols)))))
    	 color-theme-choices)

;; test for each additional frame or console
(require 'cl)
(fset 'test-win-sys 
      (funcall (lambda (cols)
    		 (lexical-let ((cols cols))
    		   (lambda (frame)
    		     (let ((color-theme-is-global nil))
		       ;; must be current for local ctheme
		       (select-frame frame)
		       ;; test winsystem
		       (eval 
			(append '(if (window-system frame)) 
				(mapcar (lambda (x) (cons x nil)) 
					cols)))))))
    	       color-theme-choices ))
;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'test-win-sys)

(color-theme-tangotango)






; ido mode
(require 'ido)
(ido-mode t)

; rosemacs
(push "~/.emacs.d/rosemacs" load-path)
(require 'rosemacs)
(invoke-rosemacs)
(global-set-key "\C-x\C-r" ros-keymap)
;;(set-ros-topic-update-interval 5)
;; (:eval (ros-current-pkg-modeline-entry))


;;; python
;;; Electric Pairs
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "\'" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default fill-column 79)

;; kill-ring <-> x11
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(defun ros-package-path (pkg)
  (save-excursion
    (with-temp-buffer
      (call-process "rospack" nil t nil "find" pkg)
      (goto-char (point-min))
      (re-search-forward "^\\(.*\\)$")
      (match-string 1))))

(add-to-list 'load-path (ros-package-path "rosemacs"))
;; (add-to-list 'load-path (concat (ros-package-path "cram_emacs_repl") "/slime"))

(setq default-tab-width 2)
(global-font-lock-mode t)
(setq query-replace-highlight t)
(setq search-highlight t)
(show-paren-mode 1)
(global-set-key '[delete] 'delete-char)
(setq minibuffer-max-depth nil)
(setq auto-mode-alist
      (append '(("\\.C$"       . c++-mode)
                ("\\.cc$"      . c++-mode)
                ("\\.c$"       . c-mode)
                ("\\.h$"       . c++-mode)
                ("makefile$"   . makefile-mode)
                ("Makefile$"   . makefile-mode)
                ("\\.asd"      . lisp-mode)
                ("\\.launch"   . xml-mode)) auto-mode-alist))
(autoload 'mwheel-install "mwheel" "Enable mouse wheel support.")

;; (require 'slime)

(require 'rosemacs)
(invoke-rosemacs)
(global-set-key "\C-x\C-r" ros-keymap)

;; (slime-setup '(slime-fancy slime-asdf slime-indentation slime-ros))
;; (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; (setq slime-multiprocessing t)

;(slime-ros)

(provide 'repl-config)

(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq explicit-shell-file-name shell-file-name)
(setq shell-command-option "-c")
(setq system-uses-terminfo nil)
(setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@`'.,:()-")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ignore start message
(setq inhibit-startup-message t)

(set-scroll-bar-mode 'right)

(require 'rst)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))

(put 'downcase-region 'disabled nil)

(setq TeX-PDF-mode t)

(add-to-list 'load-path "~/.emacs.d/highlight-indentation")
(require 'highlight-indentation) 
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(set-face-background 'highlight-indentation-face "#404040")
(set-face-background 'highlight-indentation-current-column-face "#11111") 

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key [(M C i)] 'aj-toggle-fold)

