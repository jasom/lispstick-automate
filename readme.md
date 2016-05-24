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

* quicklisp.lisp
* sbcl MSI installer
* emacs windows32 zip

And then run `sh all.sh`
