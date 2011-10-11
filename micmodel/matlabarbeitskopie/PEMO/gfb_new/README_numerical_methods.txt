This directory contains a Matlab implementation of the gammatone filterbank
described in V. Hohmann's Paper `Frequency analysis and synthesis using a
Gammatone filterbank', published 2002 in `acta acustica'.

copyright: Universitaet Oldenburg
author   : tp
date     : Jan, Apr 2002
filename : README_numerical_methods.txt


This implementation uses numerical methods to deduce the phase factors and the
gain factors needed for the resynthesis. This file contains a description of
both numerical methods.

Deduction of the phase factors
==============================

This numerical method replaces the analytical formula for the phase factors
b_k in section 4.1 of V. Hohmann's `acta acustica' article, which gives
incorrect results for filter channels with an impulse response envelope maximum
later than the desired group delay.

The b_k factors given in the article result in a pure real filter output at a
desired group delay, rather than in a local maximum in the real part of the
signal.  Because of the slope of the envelope in these cases, this is a
difference.  (The impulse response plotted in the article was in fact achieved
with hand-optimized phase factors for these cases, so the conclusions of the
article still hold.)

Choosing the sample where the real local maximum should occur
-------------------------------------------------------------

After the desired group delay is chosen to delay_samples, search for the
maximum of the envelope of impulse response within the first delay_samples
samples.  If there is no local envelope maximum, then choose the absolute
envelope maximum at sample # delay_samples.

Deriving the phase factors
--------------------------

After the complex impulse response has been multiplied by the complex phase
factor, the real part of this product will have a local maximum at this sample.
As an approximation, we will assume parabolic behaviour of the real part near
this local maximum. This means, the real part at the sample directly preceeding
the sample with the real local maximum and the real part at the sample directly
following it will be equal. If we drew a line through these two points in the
complex plain, it would be parallel to the imaginary axis.  Thus, all we have
to do is to determine the angle between the the imaginary axis and the line
through these two points _before_ the multiplication, and then rotate the
whole complex plain by this angle.  Thus, the phase factors can be approximated
by

           /  [   k[max_index+1] - k[max_index-1]    ]
b_k = 1i  /   [--------------------------------------]
         /    [ abs(k[max_index+1] - k[max_index-1]) ]



Deduction of the gain factors
=============================

The purpose of the gain factors is to achieve an almost constant response (0dB)
of the analysis-synthesis system for all frequencies.

When looking at the frequency response of the individual filter channels of the
analysis filterbank (the plot produced by "Example_Filterbank.m", or figure 3
of the `acta acustica' article), one can deduce that the frequency response
of the analysis-synthesis system at the center frequency of one particular
channel is dominated by the gain factor of the channel with this particular
center frequency.  The gain factors of the directly neighbouring channels will
also have some minor influence, but the influence of the other channels can be
neglected.

The gain factors are computed in iterations.  For the first iteration, all
gain factors are set to 1.0 (0dB).
During each iteration, the frequency-response of the analysis-synthesis system
is evaluated for the center frequencies of the filterbank channels. The gain
factors of the individual channels are then adjusted as if the frequency
response of the analysis-synthesis system at the center frequency of each
channel depended only on the gain factor of this paricular channel:

                                        gain_factor[channel, iteration-1] 
gain_factor[channel, iteration] = ---------------------------------------------
                                  frequency_response(center_frequency[channel])

Because of the influence of the directly neigbouring channels, the resulting
frequency response at the channels' center frequencies in the next iteration is
not equal to 0dB.  But because the influence of the neighbouring channels is
minor, compared to the influence of the gain factor of the channel at the
center frequency in question, the frequency respone will generally be closer
to 0dB than in the previous iteration, and the gain factors will converge
eventually.



-----------------------------------------------------------------------------

   Copyright (C) 2002   AG Medizinische Physik,
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
