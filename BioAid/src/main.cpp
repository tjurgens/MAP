//
//  main.cpp
//  BioAid
//
//  Created by nrclark on 03/05/2012.
//  Copyright (c) 2012 Nick Clark. All rights reserved.
//

#include <iostream>
#include <boost/scoped_array.hpp>
#include <boost/thread/mutex.hpp>


#include "params.h"
#include "algoComponents.h"
#include "algoInterface.h"


void showData(const float* L, const float*R, int numel)
{
    for(int nn=0; nn<numel; ++nn)
        std::cout << "L[" << nn << "]=" << L[nn] << "  ----   "
                  << "R[" << nn << "]=" << R[nn] << std::endl;
}

int main(int argc, const char * argv[])
{
    
	{
        int numSamples = 16;
        
        // the () at the end = zero init like calloc 
        boost::scoped_array<float> lDataIn( new float[numSamples]() );    
        boost::scoped_array<float> rDataIn( new float[numSamples]() ); 
        boost::scoped_array<float> lDataOut( new float[numSamples]() );     
        boost::scoped_array<float> rDataOut( new float[numSamples]() ); 
                
        lDataIn[0] = rDataIn[0] = 1.0f; // make impulse
        
        // Make the data look like 2D C-style arrays (the process mathod requires data in this format)
        // ..this fits with other audio APIs like VST nicely
        float *plDataIn = lDataIn.get();
        float *prDataIn = rDataIn.get();
        float *plDataOut = lDataOut.get();
        float *prDataOut = rDataOut.get();
        float* in2D[] =  {plDataIn, prDataIn};
        float* out2D[] = {plDataOut, prDataOut};
                
        showData(lDataIn.get(), rDataIn.get(), numSamples);
        
        {
           //      _                        _ 
           //   __| | ___ _ __ ___   ___   / |
           //  / _` |/ _ \ '_ ` _ \ / _ \  | |
           // | (_| |  __/ | | | | | (_) | | |
           //  \__,_|\___|_| |_| |_|\___/  |_|
           // Stereo     
            
            // Creating and passing in a Mutex is useless in this (single threaded) demo, but it demostrates the syntax. 
            // It is fine to just omit the arg (see demo_2).
            boost::mutex myMutex;
            
            cSharedStereoParams sharedPars(&myMutex);        
            cUniqueStereoParams leftPars(&myMutex);   
            cUniqueStereoParams rightPars(&myMutex); 
            cAidAlgo myAlgo(leftPars, rightPars, sharedPars, &myMutex); //Supply with identical LR pars
  
            
            myAlgo.processSampleBlock ((const float**) in2D,  2,  (float**) out2D,   2,   numSamples);        
            showData(lDataOut.get(), rDataOut.get(), numSamples);
            
            // Now change a parameter in one channel, process and see the new output
            assert(!rightPars.setParam("OutputGain_dB", 6.f));  // Returns a bool letting you know if the parameter you're trying to set even exists!                     
            myAlgo.processSampleBlock ((const float**) in2D,  2,  (float**) out2D,   2,   numSamples);        
            showData(lDataOut.get(), rDataOut.get(), numSamples);
        }
        
        {            
           //      _                        ____  
           //   __| | ___ _ __ ___   ___   |___ \ 
           //  / _` |/ _ \ '_ ` _ \ / _ \    __) |
           // | (_| |  __/ | | | | | (_) |  / __/ 
           //  \__,_|\___|_| |_| |_|\___/  |_____|
           // Mono in with dual out   

            cSharedStereoParams sharedPars;        
            cUniqueStereoParams leftPars;   
            assert(!leftPars.setParam("OutputGain_dB", 6.f));
            assert(!leftPars.setParam("InputGain_dB", 6.f));
            assert(!leftPars.setParam("Band_3_Gain_dB", 10.f));
            cAidAlgo myAlgo(leftPars, sharedPars); //Supply with identical LR pars
            myAlgo.processSampleBlock ((const float**) in2D,  1,  (float**) out2D,   2,   numSamples); 
            showData(lDataOut.get(), rDataOut.get(), numSamples);
        }

	}
    
#if defined _WIN32 || defined _WIN64    // Just wiats for user input before vanishing
	std::string xyz;
	std::cin >> xyz;
#endif

    
}

