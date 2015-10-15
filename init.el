;; no more big toolbar
(tool-bar-mode -1)
;; no more ugly screen at the beginning
(setq inhibit-startup-screen t) 

;;(cd "C:/Users/JeCisC/Desktop")
;;(setq default-directory "~/Desktop/")
(setq default-directory (expand-file-name "~/"))

;; I add the lisp folder to the load path
;; (add-to-list 'load-path "~/.emacs.d/lisp/")

;;Backup files~
(setq
 backup-by-copying t ;; copy files and don't rename them
 backup-directory-alist (quote (("." . "~/.emacs.d/backups"))) ;;The temp files should be store into backup directory.
 delete-old-versions t ;; do not ask me to delete backups
 kept-new-versions 6
 kept-old-versions 10
 version-control t
)

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;; Use Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun generate-temporary-buffer ()
  "open up a guaranteed new scratch buffer"
 (interactive)
  (switch-to-buffer (make-temp-name "scratch")))
