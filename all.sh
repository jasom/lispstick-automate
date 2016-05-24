set -e

OUTDIR="${OUTDIR:-lispstick}"
export OUTDIR


mkdir -p $OUTDIR

EMACS_SOURCE="$(echo inputs/emacs-*.zip)"
test -e "$EMACS_SOURCE"
EMACS_VERSION="$(basename "$EMACS_SOURCE")"
EMACS_VERSION="${EMACS_VERSION#*-}"
EMACS_VERSION="${EMACS_VERSION%%-*}"
EMACS_DEST="$OUTDIR/emacs-$EMACS_VERSION"
export EMACS_VERSION

SBCL_SOURCE="$(echo inputs/sbcl-*.msi)"
SBCL_VERSION="${SBCL_SOURCE#*-}"
SBCL_VERSION="${SBCL_VERSION%%-*}"
SBCL_DEST="$OUTDIR/sbcl/$SBCL_VERSION"
export SBCL_VERSION

ZIPFILE="${1:-lispstick-sbcl-$SBCL_VERSION-emacs-$EMACS_VERSION.zip}"

sh sbcl.sh "$SBCL_SOURCE" "$SBCL_DEST"
#LISP="eval SBCL_HOME=$SBCL_DEST wine $SBCL_DEST/sbcl --no-sysinit --no-userinit"
SBCL_HOME=$SBCL_DEST
export SBCL_HOME
LISP="$SBCL_DEST/sbcl"
export LISP


sh emacs.sh "$EMACS_SOURCE" "$EMACS_DEST"

sh dotemacs.sh "$OUTDIR/.emacs"

sh quicklisp.sh inputs/quicklisp.lisp "$OUTDIR/quicklisp"

sh run.bat.sh "$OUTDIR/run.bat"

zip -9r "$ZIPFILE" "$OUTDIR"

rm -rf "$OUTDIR"

echo
echo
echo "If you are reading this, I've successfully made a lispstick zip file in '$ZIPFILE'"
