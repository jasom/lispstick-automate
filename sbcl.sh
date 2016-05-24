wine msiexec /qn /i "$1" ADDLOCAL=Minimal,Contrib "INSTALLDIR=$(echo "$2"|sed 's/\//\\/g')"
