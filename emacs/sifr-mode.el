;;; sifr-mode.el --- Sifr filetype and LSP integration -*- lexical-binding: t; -*-

(require 'eglot)

(define-derived-mode sifr-mode prog-mode "Sifr"
  "Major mode for Sifr source files."
  (setq-local comment-start "#")
  (setq-local comment-end ""))

(add-to-list 'auto-mode-alist '("\\.sifr\\'" . sifr-mode))
(add-to-list 'eglot-server-programs '(sifr-mode . ("sifr" "lsp" "--stdio")))

(defun sifr-format-buffer-on-save ()
  "Format Sifr buffers through the active LSP server before saving."
  (when (and (derived-mode-p 'sifr-mode) (eglot-managed-p))
    (eglot-format-buffer)))

(add-hook 'sifr-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'sifr-format-buffer-on-save nil t)))

(provide 'sifr-mode)

;;; sifr-mode.el ends here
