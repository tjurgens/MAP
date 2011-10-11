This directory contains a Matlab implementation of the gammatone filterbank
described in V. Hohmann's Paper `Frequency analysis and synthesis using a
Gammatone filterbank', published 2002 in `acta acustica'.

copyright: Universitaet Oldenburg
author   : tp
date     : Jan, Apr 2002, Nov 2003
filename : README.txt

This is a pure Matlab implementation.  Its focus is on readability of the
source code rather than performance.  (Alternatively, the filterbank analysis
is also implemented in C, and can be called and used in place of the Matlab
function).

All parts of the implementation will also work with Octave, a free interpreter
that is largely compatible with Matlab (see http://www.octave.org/).

Documentation
=============

README_implementation.txt:  Introduces the design principles behind this
                            implementation, and containes a list of the 
                            implemented Matlab functions.
README_examples.txt:        Explains where to find the specific implementations
			    and how to execute the examples promised in section
                            5 of the `acta acustica' article.
README_extension.txt:       Explains how to compile and use the filterbank
                            analysis function written in C, to speed up
                            calculation with respect to the analysis performed
                            with native matlab/octave functions.
README_numerical_methods.txt   Describes numerical methods used to find weights
                            and phase factors used for resynthesis.
README_analyzers.txt        Explains the concept of pluggable analyzers.

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

   Author: Tobias Peters (tobias@medi.physik.uni-oldenburg.de)

-----------------------------------------------------------------------------
