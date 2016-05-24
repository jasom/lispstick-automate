cat > $1 <<EOF
SET EMACS=emacs-$EMACS_VERSION
SET SBCL=sbcl\\$SBCL_VERSION

SET HOME=%CD%
SET APPDATA=%CD%\AppData
SET LOCALAPPDATA=%CD%\AppData\Local
SET SBCL_HOME=%CD%\%SBCL%\\
SET PATH=%SBCL_HOME%\;%PATH%

%CD%\%EMACS%\bin\runemacs.exe -Q --load  %CD%\.emacs --directory %CD%
EOF
