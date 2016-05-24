ZIPFILE="$(readlink -f $1)"
set -e
mkdir "$2"
cd "$2"
unzip "$ZIPFILE"
