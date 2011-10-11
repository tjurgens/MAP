/* 
 * This file implements the calculation of some parameters needed for the
 * gammatone filterbank (-> 'gammatone.c') as a C function, to be
 * incorporated into MATLAB as a MEX function.
 * 
 * filename : getgammaparam.c
 * copyright: Universitaet Oldenburg
 * authors  : rh et al. 
 * date     : 1998
 * update   : 08/2003
 */


/*-----------------------------------------------------------------------------
 *   Copyright (C) 1998-2003   AG Medizinische Physik,
 *                             Universitaet Oldenburg, Germany
 *                             http://www.physik.uni-oldenburg.de/docs/medi
 *   
 *   Permission to use, copy, and distribute this software/file and its
 *   documentation for any purpose without permission by UNIVERSITAET OLDENBURG
 *   is not granted.
 *   
 *   Permission to use this software for academic purposes is generally
 *   granted.
 *
 *   Permission to modify the software is granted, but not the right to
 *   distribute the modified code.
 *
 *   This software is provided "as is" without expressed or implied warranty.
 *
 *   Authors:                                                                    
 *
 *   Rainer Huber         (rainer.huber@uni-oldenburg.de)                
 *   Michael Kleinschmidt                 
 *   Martin Hansen                         
 *   Juergen Tchorz                           
 *   Andreas Krause
 *---------------------------------------------------------------------------*/

/**
 *-------------------------------------------------------------------------------------------------------------
 * Conditional defines
 *#define BUILD_STDINOUT_APP
 *#define USAGE
 */
#define BUILD_MEXDLL

#define GFB_DOUBLE double
#define GFB_ORDER 4                                                          
#define GFB_LIMIT    24.7 /* Limit */                                        
#define GFB_Q       9.265 /* Q = 1 / (k1 * k2) */                            
#define GFB_PROD (GFB_Q * GFB_LIMIT)                                         
#define GFB_CTRCF        1000 /* force center frequency 1kHz for one channel */  

#include <math.h>
#include "gammatone.h"
#ifdef BUILD_MEXDLL
	#include "mex.h"
#endif
/* Optional: Include user defined source */
#ifdef INCLUDE_USER_FUNC
#include "_include_user_func_include.txt"
#endif

/**
 *-------------------------------------------------------------------------------------------------------------
 */

#ifndef TRUE
	#define TRUE	1
	#define FALSE	0
#endif

#ifdef BUILD_MEXDLL
	/* Input Arguments */
	#define MINCF			prhs[0]
	#define MAXCF 			prhs[1]
	#define DENSITY		prhs[2]
	/* Output Arguments */
	#define NRCHANNELS	plhs[0]
	#define CENTERERB		plhs[1]
	#define CENTERHZ		plhs[2]
	
	#define max(a,b)    (((a) > (b)) ? (a) : (b))
	#define min(a,b)    (((a) < (b)) ? (a) : (b))
	
#endif

/**
 *-------------------------------------------------------------------------------------------------------------
 */


/*****************************************************************************
 Description: transforms frequency to erb scale (plain number)               *
 Input: frequency in Hertz                                                   *
 Algorithm: x = f / Q + LIMIT with  x = erb                                  *
        ==> Q * x = f + PROD  with PROD = Q * LIMIT                          *
                                                                             *
            Integral 1 / [x + PROD] dx                                       *
          = 1 / PROD * Integral 1 / [(x / PROD) + 1] dx                      * 
          = a * Integral 1 / [ax + 1] dx with a = 1 / PROD                   *
          = 1 / a * log [ax + 1]                                             *
          = PROD * log [1 + x / PROD]                                        *
          there is a bug in the derivation of the formula. The formula is OK * 
 Returns: frequency on an erb-based scale (number)                           *
*****************************************************************************/

GFB_DOUBLE Frq2Erb(GFB_DOUBLE frq) 
{
    GFB_DOUBLE erb ;
    
    erb = GFB_Q * log(((GFB_DOUBLE)1.0) + frq / GFB_PROD) ;
    
    return erb ;
} /* end Frq2Erb */

GFB_DOUBLE erbscale2hz(GFB_DOUBLE erbscale)
{
	return ( (exp(erbscale/GFB_Q) - 1.0) * GFB_LIMIT * GFB_Q);
} /* erbscale2hz() */



/**
 *-------------------------------------------------------------------------------------------------------------
 */


/*****************************************************************************
 Description: calculate number of filter center frequencies between the      *
              frequencies MINCF and MAXCF                                    *
 Input:  Minimum and Maximum Center Frequency                                *
 Returns: nch                                                                *
*****************************************************************************/

int  gfb_NumberOfChannels(GFB_DOUBLE mincf, GFB_DOUBLE maxcf, GFB_DOUBLE density)
{
     GFB_DOUBLE min, max, base;
     int nch;
     
     min = Frq2Erb (mincf) ;
     base = Frq2Erb (GFB_CTRCF) ;
     max = Frq2Erb (maxcf) ;
     
     if (min != max) 
     {
	  nch = (int) floor( (base - min) * density) 
	       + (int) floor( (max - base) * density) + 1 ;
	  if (!nch) nch++ ; /* if both min & max are below base [or above base] */
     }
     else 
     {  
       nch = 1 ;
     }
     
     return nch ;

} /* end NumberOfChannels */


/**
 *-------------------------------------------------------------------------------------------------------------
 */


/*****************************************************************************
 Description: generate array of filter center frequencies between the        *
              frequencies MINCF and MAXCF  (FOR FEAT_F)                      *
																			 *	
 Output: center frequencies of gammatone filterbank in ERB (Cambridge code)  *
*****************************************************************************/

int  gfb_NewGenCtrFrq(GFB_DOUBLE *ctrfrq, GFB_DOUBLE mincf, GFB_DOUBLE maxcf, GFB_DOUBLE density, int nch)
{
	GFB_DOUBLE min, max, base, start;
	int nNumberOfCf = 0;
     
	min  = Frq2Erb(mincf);
	base = Frq2Erb(GFB_CTRCF);
	max  = Frq2Erb(maxcf);
     
	if ( min!=max )
	{
		start = base - (GFB_DOUBLE)floor( (base - min) * density) / density ;
	  	for (; nNumberOfCf<nch; nNumberOfCf++) /* fill array scale points 1. / density apart */
	    	ctrfrq[nNumberOfCf] = start + (GFB_DOUBLE)nNumberOfCf / density ;
	}
	else
	{
		ctrfrq[0] = min;
		nNumberOfCf = 1;
	}
	  
	return nNumberOfCf;
} /* end gfb_NewGenCtrFrq*/


/**
 *-------------------------------------------------------------------------------------------------------------
 *-------------------------------------------------------------------------------------------------------------
 */

#ifdef BUILD_MEXDLL

void usage()
{
	mexPrintf("\n");
#ifdef NO_HELP
	mexPrintf(" Wrong usage!\n"); 
	mexPrintf(" Copyright: University of Oldenburg, HörTech gGmbH 2005\n");
#else
	mexPrintf(" Usage: [NRCHANNELS, CENTERERB, CENTERHZ] = GETGAMMAPARAM(MINCF,MAXCF,DENS)\n");
	mexPrintf("\n");
	mexPrintf(" Calculates some parameters that are needed for a gammatone filterbank\n");
	mexPrintf("\n");
	mexPrintf(" Parameters:\n");
	mexPrintf("	  NRCHANNELS:  number of channels of the desired filterbank\n");
	mexPrintf("	  CENTERERB:   array of centerfrequencies (in ERB)\n");            
	mexPrintf("	  CENTERHZ:    array of centerfrequencies (in Hz)\n");
	mexPrintf("	  MINCF:       lowest centerfrequency (in Hz)\n");
	mexPrintf("	  MAXCF:       highest centerfrequency (in Hz)\n");
	mexPrintf("	  DENS:        density of the filterbank in 1/ERB\n");
	mexPrintf("\n"); 
	mexPrintf(" copyright: University of Oldenburg 1998-2005\n");
#endif
	mexPrintf("\n");
} /* usage() */

/**
 *-------------------------------------------------------------------------------------------------------------
 *-------------------------------------------------------------------------------------------------------------
 */

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	double MinCF, MaxCF, Dens;			/* Input */
	double *NrChannels, *CenterErb, *CenterHz;    /* Output */
	int nNrChannels;
   int i, m, n;
  	int exit = FALSE;
	
  	/* Check for proper number of arguments */
  	if ((nrhs != 3) || (nlhs != 3)) {
    	usage();
    	exit = TRUE;
  	} 

	/* Optional: Include user defined source */
#ifdef INCLUDE_USER_FUNC
	#include "_include_user_func.txt"
#endif
  	
  	if (!exit) {
  		/* Check the dimensions and type of MinCF */
  		m = mxGetM(MINCF);
  		n = mxGetN(MINCF);
  		if (!mxIsNumeric(MINCF) || mxIsComplex(MINCF) || !mxIsDouble(MINCF) || (max(m,n) != 1)) 
		{
#ifdef NO_HELP
   			mexErrMsgTxt("Invalid input format.");
#else
   			mexErrMsgTxt("GETGAMMAFBPARAM requires that MinCF be a real value.");
#endif
		}
   			
   		/* Check the dimensions and type of MaxCF */
  		m = mxGetM(MAXCF);
  		n = mxGetN(MAXCF);
  		if (!mxIsNumeric(MAXCF) || mxIsComplex(MAXCF) || !mxIsDouble(MAXCF) || (max(m,n) != 1)) 
		{
#ifdef NO_HELP
   			mexErrMsgTxt("Invalid input format.");
#else
   			mexErrMsgTxt("GETGAMMAFBPARAM requires that MaxCF be a real value.");
#endif
		}
  	
		/* Check the dimensions and type of Dens */
  		m = mxGetM(DENSITY);
  		n = mxGetN(DENSITY);
  		if (!mxIsNumeric(DENSITY) || mxIsComplex(DENSITY) || !mxIsDouble(DENSITY) || (max(m,n) != 1)) 
		{
#ifdef NO_HELP
   			mexErrMsgTxt("Invalid input format.");
#else
   			mexErrMsgTxt("GETGAMMAFBPARAM requires that Dens be a real value.");  	
#endif
		}
   		
   		/* Assign values to the various parameters*/
	  	MinCF = mxGetScalar(MINCF);
	  	MaxCF = mxGetScalar(MAXCF);
	  	Dens = mxGetScalar(DENSITY);

		/* Create matricies (vectors) for the return argument */
  		NRCHANNELS = mxCreateDoubleMatrix(1, 1, mxREAL);
  		NrChannels = mxGetPr(NRCHANNELS);

  		*NrChannels = (double)gfb_NumberOfChannels(MinCF, MaxCF, Dens);
  		nNrChannels = (int)*NrChannels;

  		CENTERERB = mxCreateDoubleMatrix(1, nNrChannels, mxREAL);
  		CenterErb = mxGetPr(CENTERERB);
		gfb_NewGenCtrFrq(CenterErb, MinCF, MaxCF, Dens, (int)*NrChannels);

  		CENTERHZ = mxCreateDoubleMatrix(1, nNrChannels, mxREAL);
  		CenterHz = mxGetPr(CENTERHZ);
  		for (i=0; i<nNrChannels; i++)
  			CenterHz[i] = erbscale2hz(CenterErb[i]);
  	}
}

#endif

