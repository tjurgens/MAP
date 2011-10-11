This file contains a short description of how to create and use pluggable
analyzers, i.e. several filterbanks of gammatone filters, where each filterbank
is designed to process the (complex) output of the previous filterbank.

Overview
--------

A Gfb_Analyzer structure can either split a real-valued, one-band input singnal
into several complex-valued frequency bands, or process a such an already
splitted complex signal. In the latter case, each filter of the filter bank
only sees input from its corresponding band.

To be able to sensibly feed the output of one gammatone filter bank into
another filterbank, the filterbanks
- must have been built for the same sampling frequency and filter frequencies
- have to be designed for taking either real input or complex input -- changing
  the order of filterbank application is thus not possible

A tuple of Filterbanks satisfying these conditions is called "pluggable".

Creation
--------

There are two ways to create pluggable filterbanks:

1) Create one Analyzer using Gfb_Analyzer_new, and then split it into two or
   more analyzers using Gfb_Analyzer_split.
2) Create serveral Analyzers at once using Gfb_Analyzer_new, with a vector
   argument for the gamma_order parameter.

Usage
-----

a) Synthesizer creation
  The Gfb_Synthesizer_new method accepts a structure array of multiple
  Gfb_Analyzers.
b) Filtering
  Invoke Gfb_Analyzer_process or Gfb_Analyzer_fprocess separately for each
  Gfb_Analyzer.
