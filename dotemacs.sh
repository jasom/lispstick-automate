cat > $1 <<EOF
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(slime-setup '(slime-fancy))
(define-key global-map (kbd "<f12>") 'slime-selector)
(slime)
EOF
