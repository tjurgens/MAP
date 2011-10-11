This directory contains a Matlab implementation of the gammatone filterbank
described in V. Hohmann's Paper `Frequency analysis and synthesis using a
Gammatone filterbank', published 2002 in `acta acustica'.

copyright: Universitaet Oldenburg
author   : tp
date     : Jan, Apr 2002, Oct 2003
filename : README_extension.txt

This file explains how to compile and use the filterbank analysis function
written in C++.


Compiling for matlab:
=====================

Matlab extensions are compiled with the "mex" command. Within the matlab
interpreter, change to the directory where this gammatone filterbank
implementation was unpacked:
>> cd unpack_directory

Then, issue the mex command to compile the matlab extension:
>> mex Gfb_Analyzer_fprocess.cpp

If the compilation fails, then please make sure you have set up matlab
properly so that the mex command works. Use the "mex -setup" command to
choose your desired C++ compiler, and try to compile a mex example from
the <matlab>/extern/mex/examples directory.

If you would like to use compiler optimization (recommended), then issue
the command
>> mex -o Gfb_Analyzer_fprocess.cpp
instead.

Using the extension for faster filtering:
=========================================

As usual, you create a Gfb_Analyzer filterbank with the function
Gfb_Analyzer_new.
Then there are two options how to use the extension:
(1) Replace calls to Gfb_Analyzer_process with calls to Gfb_Analyzer_fprocess
    in your source code
(2) The Gfb_Analyzer structure contains a field "fast", with its value set
    to 0 on creation. Set this value to 1, and the extension will be used
    automatically whenever you call Gfb_Analyzer_process.


-----------------------------------------------------------------------------

   Copyright (C) 2002 2003  AG Medizinische Physik,
                        Universitaet Oldenburg, Germany
                        http://www.physik.uni-oldenburg.de/docs/medi

   Permission to use, copy, and distribute this software/file and its
   documentation for any purpose without permission by UNIVERSITAET OLDENBURG
   is not granted.
   
   Permission to use this software for academic purposes is generally
   granted.

   Permission to modify the software is granted, but not the right to
   distribute the modified code.

   This software is provided "as is" without expressed or implied warranty.

   Author: Tobias Peters (tpeters@uni-oldenburg.de)

-----------------------------------------------------------------------------
