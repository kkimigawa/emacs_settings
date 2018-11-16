(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")  t)
(package-initialize)

(eval-when-compile (require 'cl))

(defvar installing-package-list
  '(
    company
    company-c-headers
    csharp-mode
    dockerfile-mode
    dumb-jump
    git-gutter
    google-c-style
    helm
    helm-core
    helm-git-grep
    helm-ls-git
    helm-swoop
    init-loader
    lua-mode
    magit
    markdown-mode
    typescript-mode
    web-mode
    wgrep
    yaml-mode
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))


(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
