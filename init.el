;; no more big toolbar
(tool-bar-mode -1)
;; no more ugly screen at the beginning
(setq inhibit-startup-screen t) 

;;(cd "C:/Users/JeCisC/Desktop")
;;(setq default-directory "~/Desktop/")
(setq default-directory (expand-file-name "~/"))

;; I add the lisp folder to the load path
;; (add-to-list 'load-path "~/.emacs.d/lisp/")

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


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
