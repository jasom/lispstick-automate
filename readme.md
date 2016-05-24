Automated Lispstick generator
=============================

This is a set of scripts to generate a portable windows lisp development
environment.

Requirements
------------

* wine
* sh
* zip/unzip

I have only tested it so far on windows, but it should work anywhere the above
will run

Instructions
------------

Place the following files in inputs:

* quicklisp.lisp [from here][1]
* sbcl MSI installer [from here][2]
* emacs windows32 zip [from here][3]

And then run `sh all.sh`

Notes
-----

Credit to Patrick Rusnotto for the original [LispStick][4] that this is based
off of

[1]: http://beta.quicklisp.org/quicklisp.lisp
[2]: http://www.sbcl.org/platform-table.html
[3]: http://ftp.gnu.org/gnu/emacs/windows/
[4]: http://www.iqool.de/lispstick.html
