//
//  params.h
//  BioAid
//
//  Created by nrclark on 04/05/2012.
//  Copyright (c) 2012 Nick Clark. All rights reserved.
//

#ifndef BioAid_params_h
#define BioAid_params_h

#include "utils.h"

#include <map>

#include <boost/signals2.hpp>
#include <boost/thread/mutex.hpp>
#include <boost/lexical_cast.hpp>

// The following define statement helps each parameter class generate default within channel pars.
// By setting the pars at instantiation, then using the public setParam method, we can prevent users
// inadvertantly adding nonexistant parameters to the map and return an error signal if they do.
#define MAX_NUM_BANDS_EVER 50
// Hopefully nobody will ever want more than 50 chans (but they can easily change this if needs be)
// The error sig is just a TRUE return value, so you can take it or leave it. The algorithm will still function
// using default values. It is a flexible soultion.


//                                _               
//  ___ _   _ _ __   ___ _ __ ___| | __ _ ___ ___ 
// / __| | | | '_ \ / _ \ '__/ __| |/ _` / __/ __|
// \__ \ |_| | |_) |  __/ | | (__| | (_| \__ \__ \
// |___/\__,_| .__/ \___|_|  \___|_|\__,_|___/___/
//           |_|                                  


//------------------------------------------------------------------------
// Abstract superclass model
//------------------------------------------------------------------------
class cParameterContextModel
{
protected:
    typedef std::map<std::string, float> paramMap_t; 
    typedef boost::signals2::signal<void (cParameterContextModel&)> paramChangeSignal_t;
    typedef paramChangeSignal_t::slot_type paramChangeSlot_t;
    typedef boost::signals2::connection connection_t;
    
    paramMap_t paramMap;    
    paramChangeSignal_t paramChangeSignal;
    
    virtual void populateDefaultPars() = 0;
    
    boost::mutex* pMyMutex; //option lock applied before sending signals
    
    
public:
    cParameterContextModel(boost::mutex* _pMyMutex = NULL) : //cTor taking optional mutex
    pMyMutex(_pMyMutex)
    {        
    }
 
    connection_t addSubscriber(const paramChangeSlot_t& slot)
    {       
        return paramChangeSignal.connect(slot);
    }
    
    float getParam( std::string key, float const & defaultVal = 0.f )
    {        
        paramMap_t::iterator it = paramMap.find(key); 
        if ( it == paramMap.end() ) 
        {
            //better to return default value than nothing if the key does not exist.
            DBGM("Warning: No key exists named " << key << ". Returning default value = " << defaultVal);
            return defaultVal; 
        }
        else 
            return it->second; 
    }
    
    
    bool  isParam( std::string key )
    {        
        paramMap_t::iterator it = paramMap.find(key); 
        if ( it == paramMap.end() ) 
            return false; 
        else 
            return true; 
    }
    
    bool  setParam( std::string key, float const & newVal )
    {
        bool  isNewKey = !isParam(key);           
        bool  isNewVal = ( getParam(key) != newVal ); // (uses default val of function if it doesnt exist)          
        
        if ( isNewKey || isNewVal )
        {          
            paramMap[key] = newVal;   //Only go to the effort of updating map if something is new
            
            const NullCheckingScopedLock l(pMyMutex); //Lock this as short as possible 
            paramChangeSignal(*this); //Only go to the effort of messaging if something is new        
        }
        
        if (isNewKey) {
            return true; //Returning true indicates the key doesnt exist (this can be interpreted as an error or just ignored).
        } else {
            return false; //End of function reached without error (again, the return can be ignored)
        }
        
    } 
    

};


//            _          _                         
//  ___ _   _| |__   ___| | __ _ ___ ___  ___  ___ 
// / __| | | | '_ \ / __| |/ _` / __/ __|/ _ \/ __|
// \__ \ |_| | |_) | (__| | (_| \__ \__ \  __/\__ \
// |___/\__,_|_.__/ \___|_|\__,_|___/___/\___||___/


//------------------------------------------------------------------------
// Concrete base for parameters UNIQUE TO each stereo channel
//------------------------------------------------------------------------
class cUniqueStereoParams : public cParameterContextModel
{
private:
    void populateDefaultPars()
    {        
        // Units are linear unless specifically qualified by the "_dB" suffix
        paramMap["InputGain_dB"]  = 0.f;
        paramMap["OutputGain_dB"] = 0.f;                
        
        paramMap["ARthreshold_dBSPL"] = 110.f;
        paramMap["ARtc"] = 0.006f;
        paramMap["ARlatency"] = 0.005f;            
        
        for (int nn = 0; nn<MAX_NUM_BANDS_EVER/*(int)getParam("NumBands")*/; ++nn) {                        
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_InstantaneousCmpThreshold_dBspl"] = 65.f;
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_DRNLc"] = 0.2f;        
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_Gain_dB"] =  0.0f;                
        } 
    }
    
public:
    cUniqueStereoParams(boost::mutex* _pMyMutex = NULL) : 
    cParameterContextModel(_pMyMutex) // pass to superclass cTor
    {
        populateDefaultPars();
    }        
};

//------------------------------------------------------------------------
// Concrete base for parameters SHARED BY each stereo channel
//------------------------------------------------------------------------
class cSharedStereoParams : public cParameterContextModel
{
private:
    void populateDefaultPars()
    {    
        paramMap["SampleRate"] = 44100.f;    
        paramMap["IsStereo"] = 0.0f;
        paramMap["NumBands"] = 6.f;
        for (int nn = 0; nn<MAX_NUM_BANDS_EVER; ++nn) {   
            
            const float cf = 250.f * powf( 2.f, (float)nn );
            const float bw = 1.f;
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_LowBandEdge"] = cf *  powf(2.f, -bw/2.f);
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_HighBandEdge"] = cf *  powf(2.f, bw/2.f); 
            
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_MOCtc" ] = 0.070f;
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_MOCfactor" ] = 0.8f;
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_MOClatency" ] = 0.010f;        
            paramMap[ "Band_" + boost::lexical_cast<std::string>(nn) + "_MOCthreshold_dBspl" ] = 25.0f;              
        } 
    }
    
public:
    cSharedStereoParams(boost::mutex* _pMyMutex = NULL)  : 
    cParameterContextModel(_pMyMutex)
    {
        populateDefaultPars();
    }   
};

#endif
