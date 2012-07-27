//
//  algoInterface.h
//  BioAid
//
//  Created by Nick on 24/05/2012.
//  Copyright (c) 2012 Nick Clark. All rights reserved.
//

#ifndef BioAid_algoInterface_h
#define BioAid_algoInterface_h

#include <boost/thread/mutex.hpp>
#include <boost/scoped_ptr.hpp>

#include "params.h"
#include "algoComponents.h"



class cAidAlgo
{
private:        
    boost::scoped_ptr<cMOCsimContainer > pMOCsimContainer;    //Abstract this away, the user need not be confused by this implementation detail
    boost::scoped_ptr<cAidStereoChannelManager > pManagerL;
    boost::scoped_ptr<cAidStereoChannelManager > pManagerR;
    
    boost::mutex* pMyMutex;
    
    
public:
    //We have dual constructors here depending on whether you want a mono or a stereo processor
    //Params cannot be const because they have subscribers added
    cAidAlgo(cUniqueStereoParams& _lPars, 
             cUniqueStereoParams& _rPars,
             cSharedStereoParams& _sharedPars, 
             boost::mutex* _pMyMutex = NULL) :
    pMOCsimContainer(new cMOCsimContainer(_sharedPars)),
    pManagerL(new cAidStereoChannelManager(_lPars, _sharedPars, *pMOCsimContainer)),
    pManagerR(new cAidStereoChannelManager(_rPars, _sharedPars, *pMOCsimContainer)),
    pMyMutex(_pMyMutex)
    {
     
    };
    
    cAidAlgo(cUniqueStereoParams& _lPars,
             cSharedStereoParams& _sharedPars, 
             boost::mutex* _pMyMutex = NULL) :
    pMOCsimContainer(new cMOCsimContainer(_sharedPars)),
    pManagerL(new cAidStereoChannelManager(_lPars, _sharedPars, *pMOCsimContainer)),
    pManagerR(NULL),
    pMyMutex(_pMyMutex)
    {
        
    };
    
    //cMOCsimContainer MOCsimContainer(sharedPars); 
    
    void processSampleBlock (const float ** inputChannelData,
                             int 	numInputChannels,
                             float ** 	outputChannelData,
                             int 	numOutputChannels,
                             int 	numSamples )
    {        
                
        bool isStereo = true;        
        // No point processing stereo if there is only one output channel
        // ..or if there is only a MONO processor
        if ( (numInputChannels > numOutputChannels) || (pManagerR==NULL) ) {
            isStereo = false; 
        }
        
        //This code sets the index for the right input channel
        //If both outputs are sharing a common input then the following loop needs to know
        int inRightIdx = 0;
        if(numInputChannels==2)
            inRightIdx = 1;
                
        {//New scope just for lock
            const NullCheckingScopedLock l(pMyMutex); //Lock this as short as possible                
            for (int nn=0; nn< numSamples; ++nn)
            {
                outputChannelData[0][nn] = pManagerL->process(inputChannelData[0][nn]);
                if (isStereo)
                    outputChannelData[1][nn] = pManagerR->process(inputChannelData[inRightIdx][nn]);
            }
        }//Mutex unlocked 
        
        //Copy the data into both channels if we are mono
        if(!isStereo && (numOutputChannels==2) )
        {
            for (int nn=0; nn< numSamples; ++nn)
            {  
                outputChannelData[1][nn] = outputChannelData[0][nn];
            }
        }
        
    }
    
    
};


#endif
