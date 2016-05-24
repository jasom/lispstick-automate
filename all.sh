set -e

OUTDIR=lispstick

mkdir -p $OUTDIR

EMACS_SOURCE="$(echo inputs/emacs-*.zip)"
test -e "$EMACS_SOURCE"
EMACS_VERSION="${EMACS_SOURCE#*-}"
EMACS_VERSION="${EMACS_VERSION%%-*}"
EMACS_DEST="$OUTDIR/emacs-$EMACS_VERSION"
export EMACS_VERSION

SBCL_SOURCE="$(echo inputs/sbcl-*.msi)"
SBCL_VERSION="${EMACS_SOURCE#*-}"
SBCL_VERSION="${SBCL_SOURCE%%-*}"
SBCL_DEST="$OUTDIR/sbcl/$SBCL_VERSION"
export SBCL_VERSION


sh sbcl.sh "$SBCL_SOURCE" "$SBCL_DEST"
LISP="eval SBCL_HOME=$SBCL_DEST wine $SBCL_DEST/sbcl --no-sysinit --no-userinit"
export LISP

sh emacs.sh "$EMACS_SOURCE" "$EMACS_DEST"

sh dotemacs.sh "$OUTDIR/.emacs"

sh quicklisp.sh inputs/quicklisp.lisp "$OUTDIR/quicklisp"

sh run.bat.sh "$OUTDIR/run.bat"

zip -9r lispstick.zip lispstick
