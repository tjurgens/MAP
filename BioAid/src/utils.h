//
//  utils.h
//  BioAid
//
//  Created by nrclark on 03/05/2012.
//  Copyright (c) 2012 Nick Clark. All rights reserved.
//

#ifndef __UTILS_H_B7FA53D3__
#define __UTILS_H_B7FA53D3__

#include <math.h>
#include <iostream>
#include <ostream>

#include <boost/thread/mutex.hpp>

#define LIN_OFFSET (1e-20f) // = -400 dB to protect from -Inf if log of zero attempted


// The DBGM macro version here allows you to use nice syntax like this ...
// DBGM("first: " << first << ", second: " << second);
#if defined(DEBUG) || defined(MATLAB_VERBOSE) 
#define DBGM(x) std::cout << x << std::endl;
#else
#define DBGM(x)
#endif



class utils
{
public:    
    
    //---- STATIC METHODS
    inline static float lin2db(const float linVal)
    {
        return 20.0f*log10f(fabs(linVal) + LIN_OFFSET) ;
    };
    
    inline static float db2lin(const float dbVal)
    {
        return powf(10.0, dbVal/20.0f) - LIN_OFFSET;
    };
    
    inline static float pa2dbspl(const float paVal)
    {
        return 20.0f*log10f( LIN_OFFSET  +  fabs(paVal)/20e-6f );
    };
    
    inline static float dbspl2pa(const float dbsplVal)
    {
        return 20e-6f * powf(10.0f, dbsplVal / 20.0f) - LIN_OFFSET;
    };       
    
    inline static void DBG(const std::string x)
    //Problem with this version is that you need to lexical_cast to show values (see macro version above)
    {
    #ifdef DEBUG
    //    std::cout << x << std::endl; //VS2008 does not like this
    #endif
    }
};

// Nice little optional ScopedLock from here (the pointer can be NULL)
// http://stackoverflow.com/questions/10752280/check-optional-mutex-before-scoped-locking
class NullCheckingScopedLock
{
public:
    NullCheckingScopedLock( boost::mutex* _pMutex)
    : pMutex( _pMutex)
    {
        if( pMutex) pMutex->lock();
        //DBGM("Mutex Lock")
    }
    
    ~NullCheckingScopedLock()
    {
        if( pMutex) pMutex->unlock();
        //DBGM("Mutex unlock")
    }
private:
    boost::mutex* pMutex;
};


#ifdef MATLAB_VERBOSE
#include "mex.h"
//Following allows us to get debug messages in Matlab console
//http://stackoverflow.com/questions/243696/correctly-over-loading-a-stringbuf-to-replace-cout-in-a-matlab-mex-file
class mystream : public std::streambuf
{
public:   
protected:
    virtual int overflow(int c = EOF) 
    {
        if (c != EOF) {
            mexPrintf("%.1s",&c);
        }
        return 1;
    }

    virtual std::streamsize xsputn(const char *s, std::streamsize n) 
    {
        mexPrintf("%.*s",n,s);
        return n;
    }    
};

#endif //MATLAB_VERBOSE


#endif  // __UTILS_H_B7FA53D3__
