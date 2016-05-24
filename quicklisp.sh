set -e
EXTRAOPTS=":path \"$2\""
wine cmd /c quicklisp.bat "$(readlink -f "$OUTDIR")" "$LISP" <<EOF
(load "$1")
(quicklisp-quickstart:install $EXTRAOPTS)
(let ((ql-util::*do-not-prompt* t))
  (ql:add-to-init-file)
  (ql:quickload "quicklisp-slime-helper")
  (ql:quickload "uiop"))
(uiop:quit)
EOF
