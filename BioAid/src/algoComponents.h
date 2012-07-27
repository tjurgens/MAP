//
//  algoComponents.h
//  BioAid
//
//  Created by nrclark on 03/05/2012.
//  Copyright (c) 2012 Nick Clark. All rights reserved.
//
//
// The whole algorithm is stuffed into a header because there is so much inlining going on.
// I wouldn't organise it like this normally, but it just seems neater with all of the inlining.

#ifndef BioAid_algoManager_h
#define BioAid_algoManager_h

#include "params.h"
#include "utils.h"

#include <boost/signals2.hpp>
#include <boost/scoped_ptr.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/circular_buffer.hpp>
#include <boost/lexical_cast.hpp>

//Just to help with cross platform (M_PI is not defined in MSVC libs)
#include <boost/math/constants/constants.hpp>

#define FILTER_DENORMAL_PROTECTOR (1e-20f)

//Forward declarations (Contents of this header)
class cFilterFrequencyBand;
class cFilterBank;
class cDRNLbrokenstick;
class cARsim;
class cMOCsim;
class cMOCsimContainer;
class cOnePoleFilter;
class cButterworthBpFilter;


//  _          _                        _                         
// | |__   ___| |_ __   ___ _ __    ___| | __ _ ___ ___  ___  ___ 
// | '_ \ / _ \ | '_ \ / _ \ '__|  / __| |/ _` / __/ __|/ _ \/ __|
// | | | |  __/ | |_) |  __/ |    | (__| | (_| \__ \__ \  __/\__ \
// |_| |_|\___|_| .__/ \___|_|     \___|_|\__,_|___/___/\___||___/
//              |_|                                               

// The first two classes for filtering are just dumb classes that are self
// contained and are not subclasses of the more specialised algoComponent.
// Scroll past these for the moe interesting stuff!

//------------------------------------------------------------------------
// cOnePoleFilter
//------------------------------------------------------------------------
class cOnePoleFilter
{   
public:    
    void initOnePoleCoeffs(float tc, float dt)
    {    
        if ((tc/dt) < 44.0f) // just under 1ms for 44.1 kHz         
            a1=0.0f;
        else
            a1 = dt/tc - 1.0f;
        
        b0 = 1.0f + a1;
        m = 0.0f; //reset memory
        dn = FILTER_DENORMAL_PROTECTOR;
    };
    
    //Just a utility method for processing a chunk of samples
    //Not used in BioAid
    void process(const float* sigIn, float* sigOut, int numel)
    {  
        for (int nn=0; nn<numel; ++nn) 
        {
            sigOut[nn] = process( sigIn[nn] );
        }
        
    }
    
    inline float process(float sigIn)
    {
        m = b0 * sigIn 
        - a1 * m 
        + dn; //build denormal protection right in
        
        //Turns out that flipping the dn value in a one pole filter can still cause the filter
        //to go AWOL. The dn is now constant providing a miniscule dc offset, hence commented line:
        //dn = -dn; //flip denomal remover       
        
        return m;
    };
    
private:
    float a1,b0,m,dn;
}; 

//------------------------------------------------------------------------
// cButterworthBpFilter
//------------------------------------------------------------------------
class cButterworthBpFilter
{        
public:    
    void initCoeffs(float dt, float fl, float fu)
    {
        //Use double precision during calculation and cast down to single for coeffs
        double q=boost::math::constants::pi<double>()*dt*(fu-fl);
        double r=boost::math::constants::pi<double>()*dt*(fu+fl);
        
        double N = pow(tan(q),2.0) + sqrt(2.0)*tan(q) + 1.0;
        double M = pow(tan(q),2.0) / N; //M after N because it depends on N
        double Oh= -cos(r) * (2.0*sqrt(2.0)*tan(q) + 4.0) / ((cos(q))*N);
        double P = (-2.0*pow(tan(q),2.0) + pow( (  (2.0*cos(r))   /  (cos(q))   ), 2.0) + 2.0 )  /   N;
        double Q = cos(r)*(2.0*sqrt(2.0)*tan(q) - 4.0)/(cos(q)*N);
        double R = (   pow(tan(q),2.0) - sqrt(2.0)*tan(q) + 1.0   )  /  N;
        
        b[0]=M;   b[1]=0.0f; b[2]=-2.f*M; b[3]=0.0f; b[4]=M;
        a[0]=1.0; a[1]=Oh;   a[2]=P;      a[3]=Q;    a[4]=R;
        
        m[0]=0.0f;   m[1]=0.0f;    m[2]=0.0f;    m[3]=0.0f;   m[4]=0.0f;
        dn = FILTER_DENORMAL_PROTECTOR;    
    }
    
    //Just a utility method for processing a chunk of samples
    //Not used in BioAid
    void process(const float* sigIn, float* sigOut, int numel)
    {  
        for (int nn=0; nn<numel; ++nn) 
        {
            sigOut[nn] = process( sigIn[nn] );
        }
    }
    
    inline float process(float sigIn)
    {
        register float w1 = sigIn - a[1]*m[1] - a[2]*m[2] - a[3]*m[3] - a[4]*m[4] + dn;            
        dn = -dn;
        
        float sigOut = b[1]*m[1] + b[2]*m[2] + b[3]*m[3] + b[4]*m[4] + b[0]*w1;         
        m[4] = m[3]; m[3] = m[2]; m[2] = m[1]; m[1] = w1;
        
        return sigOut;
    };
    
private:
    float a[5],b[5],m[5];
    float dn;
};



//                                _               
//  ___ _   _ _ __   ___ _ __ ___| | __ _ ___ ___ 
// / __| | | | '_ \ / _ \ '__/ __| |/ _` / __/ __|
// \__ \ |_| | |_) |  __/ | | (__| | (_| \__ \__ \
// |___/\__,_| .__/ \___|_|  \___|_|\__,_|___/___/
//           |_|                                  


//------------------------------------------------------------------------
// cAlgoComponent - Abstract superclass model
//------------------------------------------------------------------------
class cAlgoComponent
{
protected:
    // These are the slots for signal change notifications for
    // (S)hared and (U)nique parameters.
    // Each subclass can choose whether or not to register with the signals
    // depending on whether it needs to update its internal parameters.
    boost::signals2::scoped_connection cS, cU;
    
    // We cannot put these references in the superclass as some components only need one
    // or the other.
    //cParameterContextModel& unique_pars_ref;
    //cParameterContextModel& shared_pars_ref;
    
    // Every subclass should have an individualised method to store its own parameters
    virtual void updatePars() = 0;    
    
public:    
    // Every subclass should have an individualised method to process a sample
    inline virtual float process(float inputSample) = 0;
    
};



//            _          _                         
//  ___ _   _| |__   ___| | __ _ ___ ___  ___  ___ 
// / __| | | | '_ \ / __| |/ _` / __/ __|/ _ \/ __|
// \__ \ |_| | |_) | (__| | (_| \__ \__ \  __/\__ \
// |___/\__,_|_.__/ \___|_|\__,_|___/___/\___||___/


//------------------------------------------------------------------------
// cMOCsim
// This is now a completely separate class handed to the processor so
// it can be shared between two stereo channels via a container.
// This is the only signal class that is aware if the input is stero,
// and so the task of dealing with such a signal is contained here entirely.
//------------------------------------------------------------------------
class cMOCsim : public cAlgoComponent
{
private:
    cParameterContextModel& shared_pars_ref;
    
    boost::scoped_ptr<boost::circular_buffer<float> > circBuff_ptr;
    
    int index; //Lexical-cast this to get parameters    
    float sampleRate, tc, latency, factor, thresh_dB;    
    bool isStereo;
    
    bool isSample2of2;
    float stereoAccumulator;
    
    cOnePoleFilter MOCfilt;
    
    inline void calculateMOCresponse(float meanMOCdB)
    {        
        meanMOCdB = meanMOCdB + 6.f; //This is quirky and was in original HA software
        meanMOCdB = MOCfilt.process(meanMOCdB);
        meanMOCdB = std::max(meanMOCdB-thresh_dB, 0.0f)  *  factor;
        circBuff_ptr->push_back(  utils::db2lin(-meanMOCdB)  );        
    };
    
public:
    cMOCsim(cParameterContextModel &_shared_pars, int _index):
    shared_pars_ref(_shared_pars),
    circBuff_ptr( new boost::circular_buffer<float>(441) ),
    sampleRate(44100.0f),
    index(_index),
    tc(0.050f),
    latency(0.010),
    factor(0.5),
    thresh_dB(25.0f),
    isStereo(false),
    isSample2of2(false),
    stereoAccumulator(0.0f)
    {
        updatePars();
        
        // The MOC only needs to know about the stuff shared between both chans
        // The object itself is shared between chans and so this fact should not change!
        cS = shared_pars_ref.addSubscriber( boost::bind(&cMOCsim::updatePars, this)  ); 
    };
    
    ~cMOCsim()
    {
        DBGM("MOCsim band " << index << " deleted");
    };
    
    void updatePars()
    {        
        tc         = shared_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_MOCtc", tc ) ;
        factor     = shared_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_MOCfactor", factor );
        latency    = shared_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_MOClatency", latency );
        sampleRate = shared_pars_ref.getParam( "SampleRate", sampleRate );  
        
        isStereo = (shared_pars_ref.getParam( "IsStereo" ) > 0.5f); //Logical statement to get bool from float
        
        thresh_dB  = shared_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_MOCthreshold_dBspl", thresh_dB );
        
        
        //TODO -> if statementes here to save potentially wasted processing
        MOCfilt.initOnePoleCoeffs(tc, 1.f/sampleRate);
        
        int bufferSamples = 1 + floorf(latency*sampleRate); // Add 1 to prevent a buffersize of zero
        circBuff_ptr->set_capacity(bufferSamples);
        for(int nn=0; nn<bufferSamples; ++nn)
        {
            circBuff_ptr->push_back(1.0f); // populate with ones
        }
    };
    
    inline float process(float sigIn)
    {
        return sigIn * circBuff_ptr->front();
    }
    
    inline void pumpSample(float dataSample)
    {
        if (isStereo) {
            if (isSample2of2){
                stereoAccumulator += utils::pa2dbspl(dataSample);
                calculateMOCresponse(stereoAccumulator/2.f);
                isSample2of2 = false;
            } else {
                stereoAccumulator = utils::pa2dbspl(dataSample);
                isSample2of2 = true;
            }
        } else {
            calculateMOCresponse(utils::pa2dbspl(dataSample));
        }        
    }
};

//------------------------------------------------------------------------
// cDRNLbrokenstick
//------------------------------------------------------------------------
class cDRNLbrokenstick : public cAlgoComponent
{
private:      
    cParameterContextModel& unique_pars_ref;
    
    int index; //Lexical-cast this to get parameters
    float cmpThreshIN_pa, cmpThreshOUT;
    float DRNLb, DRNLc;
    
    void updatePars()
    {
        cmpThreshIN_pa = utils::dbspl2pa(  unique_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_InstantaneousCmpThreshold_dBspl" )  );
        DRNLc  =   unique_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_DRNLc", DRNLc );
        
        DRNLb = powf(   cmpThreshIN_pa,  1.0f-DRNLc  );  
        cmpThreshOUT = powf(    10.0f,    (  1.0f/(1.0f-DRNLc)  )  *  log10f(DRNLb)   );    
    };
    
public:
    cDRNLbrokenstick(cParameterContextModel &_unique_pars, int _index):
    unique_pars_ref(_unique_pars), 
    index(_index),
    cmpThreshIN_pa(0.3f),
    cmpThreshOUT(100.f),
    DRNLb(100.f),
    DRNLc(0.2f)
    {
        updatePars();
        
        //Only need a listener for unique pars in this object
        cU = unique_pars_ref.addSubscriber( boost::bind(&cDRNLbrokenstick::updatePars, this)  ); 
    };
        
    inline float process(float sigIn)
    {
        float abs_x = fabs(sigIn);
        if (  abs_x  >  cmpThreshOUT  )
#if defined _WIN32 || defined _WIN64
        return _copysign(1.0f, sigIn) * DRNLb * powf( abs_x , DRNLc);
#else
        return copysignf(1.0f, sigIn) * DRNLb * powf( abs_x , DRNLc);
#endif        
        else
            return sigIn;
    }    
};

// -----------------------------------------------------------------------------
// cFilterFrequencyBand
// -----------------------------------------------------------------------------
class cFilterFrequencyBand : public cAlgoComponent
{
private:
    cParameterContextModel& unique_pars_ref;
    cParameterContextModel& shared_pars_ref;
    
    boost::scoped_ptr<cDRNLbrokenstick> bs_ptr;
    
    boost::shared_ptr<cMOCsim> moc_ptr; // NOT OWNED BY THIS OBJECT
    
    int index; //Lexical cast this to get parameters
    
    float gain;
    
    float loCut, hiCut;
    float sampleRate;
    
    cButterworthBpFilter inFilter, outFilter; 
    
    void updatePars() 
    {   
        // Update filters if needed
        float OLDloCut = loCut;
        float OLDhiCut = hiCut;
        float OLDsampleRate = sampleRate;
        
        //Don't bother supplying default as function defaults to 0 which is fine for dB gain
        gain = utils::db2lin( unique_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_Gain_dB") );
        
        sampleRate = shared_pars_ref.getParam( "SampleRate", sampleRate );
        loCut = shared_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_LowBandEdge", loCut );
        hiCut = shared_pars_ref.getParam( "Band_" + boost::lexical_cast<std::string>(index) + "_HighBandEdge", hiCut );
        
        if (  (OLDloCut != loCut)  ||
            (OLDhiCut != hiCut)  ||
            (OLDsampleRate != sampleRate)  )
        {
            inFilter.initCoeffs(1.f/sampleRate, loCut, hiCut);
            outFilter.initCoeffs(1.f/sampleRate, loCut, hiCut);
        } 
        
    };    
        
    
public:
    cFilterFrequencyBand(cParameterContextModel &unique_pars, cParameterContextModel &shared_pars, int _index, boost::shared_ptr<cMOCsim> _moc_ptr) :
    unique_pars_ref(unique_pars),
    shared_pars_ref(shared_pars),
    bs_ptr ( new cDRNLbrokenstick(unique_pars,  _index) ),
    moc_ptr( _moc_ptr ),
    index(_index),
    gain(1.0f),
    loCut(9e3f),
    hiCut(10e3f),
    sampleRate(44.1e3f)
    {
        updatePars();
        
        cU = unique_pars_ref.addSubscriber( boost::bind(&cFilterFrequencyBand::updatePars, this)  ); 
        cS = shared_pars_ref.addSubscriber( boost::bind(&cFilterFrequencyBand::updatePars, this)  );
    };
    
    ~cFilterFrequencyBand() // for debugging to check destruction
    {
        DBGM("cFilterFrequencyBand " << index << " deleted." );
    };
    
    
    inline float process(float inputSample)
    {    
        float tmp = inFilter.process(inputSample);
        
        //Stuff between the filters!
        tmp = moc_ptr->process(tmp);
        tmp = bs_ptr->process(tmp);         
        moc_ptr->pumpSample(tmp);
        //End of stuff between the filters
        
        tmp = outFilter.process(tmp);
        return gain * tmp;
    }
};

//------------------------------------------------------------------------
// cMOCsimContainer
// This is a bit of a fraud and doesn't have a real process method
//------------------------------------------------------------------------
class cMOCsimContainer : public cAlgoComponent
{
private:
    //MOC related objects are freaks that do not have shared parameters
    cParameterContextModel& shared_pars_ref; 
    
    typedef boost::shared_ptr<cMOCsim> MOCband_ptr; //must be shared if we stuff into vector
    std::vector<MOCband_ptr> MOCbands;
    
    int numBands;
    
    
    void updatePars()
    {            
        //Reset vector of channel objects if needed
        int OLDnumBands = numBands;        
        numBands = (int)shared_pars_ref.getParam( "NumBands", (float)numBands );    
        
        if (OLDnumBands != numBands)
        {
            initBandVector();
        } 
    }
    
    void initBandVector() 
    {
        //MOCbands.clear(); - DO NOT EXPLICITLY CALL DESTRUCTOR OF SMART POINTER
        
        for(int index=0; index<numBands; index++)
        {
            MOCband_ptr ptr(  new cMOCsim(shared_pars_ref, index) );        
            MOCbands.push_back(ptr);
        }
    }
    
public:
    cMOCsimContainer(cParameterContextModel &shared_pars) :
    shared_pars_ref(shared_pars),
    numBands(6)
    {
        initBandVector();
        updatePars();
        
        //This object only needs updates if the number of channels change
        cS = shared_pars_ref.addSubscriber( boost::bind(&cMOCsimContainer::updatePars, this)  ); 
    }
    
    boost::shared_ptr<cMOCsim> getMOCsim_ptr(int index)
    {
        return MOCbands[index];
    }
    
    inline float process(float inputSample)
    {
        return 0.f; // This doesn't do its own processing
    }
    
};

// -----------------------------------------------------------------------------
// cFilterBank
// -----------------------------------------------------------------------------
class cFilterBank : public cAlgoComponent
{
private:
    cParameterContextModel& unique_pars_ref;
    cParameterContextModel& shared_pars_ref;
    
    int numBands;    
    
    cMOCsimContainer& MOCsim_ref;
    
    
    typedef boost::shared_ptr<cFilterFrequencyBand> band_ptr; //must be shared if we stuff into vector
    std::vector<band_ptr> chans;
    
    void updatePars() 
    {         
        //Reset vector of channel objects if needed
        int OLDnumBands = numBands;        
        numBands = (int)shared_pars_ref.getParam( "NumBands", (float)numBands );    
        
        if (OLDnumBands != numBands)
        {
            initBandVector();
        } 
    };
    
    
    void initBandVector() 
    {
        //chans.clear();  - DO NOT EXPLICITLY CALL DESTRUCTOR OF SMART POINTER HELD OBJECT
        //Don't lock here either as it is called from update pars!
        for(int index=0; index<numBands; index++)
        {
            band_ptr ptr( new cFilterFrequencyBand(unique_pars_ref, shared_pars_ref, index, MOCsim_ref.getMOCsim_ptr(index)) );        
            chans.push_back(ptr);
        }
    };
    
public:
    cFilterBank(cParameterContextModel &unique_pars, cParameterContextModel &shared_pars, cMOCsimContainer &_MOCsim_ref) :
    unique_pars_ref(unique_pars),
    shared_pars_ref(shared_pars),
    numBands(6),
    MOCsim_ref(_MOCsim_ref)
    {
        initBandVector();
        updatePars();
        
        //This object only needs to know about changes to the numer of channels, so it only needs to know about shared_pars
        cS = shared_pars.addSubscriber( boost::bind(&cFilterBank::updatePars, this)  );    
    };
    
    ~cFilterBank() //purely for debugging to check destruction
    {
        DBGM("cFilterBank destructor called")
    };
    
    
    inline float process(float inputSample)
    {
        float accumulatedOutput = 0.f;
        for(int index=0; index<numBands; index++)
        {        
            accumulatedOutput += chans[index]->process( inputSample );                     
        }
        return accumulatedOutput;
    };
};

//------------------------------------------------------------------------
// cARsim
//------------------------------------------------------------------------
class cARsim : public cAlgoComponent
{
private:
    cParameterContextModel& unique_pars_ref;
    cParameterContextModel& shared_pars_ref; 
    
    boost::scoped_ptr<boost::circular_buffer<float> > circBuff_ptr;
    
    float sampleRate, tc, latency, thresh_pa;
    
    cOnePoleFilter ARfilt;
    
    
    void updatePars()
    {
        tc         = unique_pars_ref.getParam( "ARtc", tc ) ;
        latency    = unique_pars_ref.getParam( "ARlatency", latency );
        sampleRate = shared_pars_ref.getParam( "SampleRate", sampleRate );  
        
        thresh_pa  = utils::dbspl2pa(  unique_pars_ref.getParam( "ARthreshold_dBSPL" )   );
        
        //TODO -> if statementes here
        ARfilt.initOnePoleCoeffs(tc, 1.f/sampleRate);
        
        int bufferSamples = 1 + floorf(latency*sampleRate); // Add 1 to prevent a buffersize of zero
        circBuff_ptr->set_capacity(bufferSamples);
        for(int nn=0; nn<bufferSamples; ++nn)
        {
            circBuff_ptr->push_back(1.0f); // populate with ones
        }
    }
    
public:
    cARsim(cParameterContextModel &unique_pars, cParameterContextModel &shared_pars) :
    unique_pars_ref(unique_pars),
    shared_pars_ref(shared_pars),
    circBuff_ptr( new boost::circular_buffer<float>(441) ),
    sampleRate(44100.0f),
    tc(0.005f),
    latency(0.010f),
    thresh_pa(2.f)
    {
        updatePars();
        
        //Need a listener for both here as updatePars requires both
        cS = shared_pars_ref.addSubscriber( boost::bind(&cARsim::updatePars, this)  ); 
        cU = unique_pars_ref.addSubscriber( boost::bind(&cARsim::updatePars, this)  ); 
        
        ARfilt.initOnePoleCoeffs(tc, 1.f/sampleRate);
    }
    
    
    inline float process(float sigIn)
    {
        return sigIn / circBuff_ptr->front();
    }
    
    inline void pumpSample(float dataSample)
    {
        float tmp = ARfilt.process(dataSample * dataSample); // Smooth power     
		tmp = sqrt(tmp) / thresh_pa; // RMS relative to threshold
		tmp = std::max(tmp, 1.0f); // Stop AR giving gain		
        circBuff_ptr->push_back( tmp );
    }
    
};

// -----------------------------------------------------------------------------
// cAidStereoChannelManager
// -----------------------------------------------------------------------------
class cAidStereoChannelManager : public cAlgoComponent
{
private:
    cParameterContextModel& unique_pars_ref;
    cParameterContextModel& shared_pars_ref;        
    const boost::scoped_ptr<cFilterBank>  fBank;  //Seting this const will mess with the reset    
    const boost::scoped_ptr<cARsim>  ARsim;  //Seting this const will mess with the reset    
    float inputGain, outputGain;
       
    void updatePars() 
    {    
        DBGM("Update callback in: cAidStereoChannelManager");
        
        inputGain  = utils::db2lin(   unique_pars_ref.getParam( "InputGain_dB",  utils::lin2db(inputGain) )   );
        outputGain = utils::db2lin(   unique_pars_ref.getParam( "OutputGain_dB", utils::lin2db(outputGain) )   ); 
    }
    
    
public:
    cAidStereoChannelManager(cParameterContextModel &unique_pars, cParameterContextModel &shared_pars,cMOCsimContainer &MOCsim_ref) :
    unique_pars_ref(unique_pars),
    shared_pars_ref(shared_pars),
    fBank ( new cFilterBank(unique_pars, shared_pars, MOCsim_ref) ),
    ARsim( new cARsim(unique_pars, shared_pars) ),
    inputGain(1.f),
    outputGain(1.f)
    {
        
        updatePars();
        
        // This object only has gain for each stereo-chan and so it only needs to listen to unique_pars changes
        cU = unique_pars.addSubscriber( boost::bind(&cAidStereoChannelManager::updatePars, this)  );
    }
    
    inline float process(float input)
    {
        float tmp = inputGain * input; //Apply the input gain
        tmp = ARsim->process(tmp); // Apply any AR compression
        tmp = fBank->process(tmp); // Do sub-band processing
        ARsim->pumpSample(tmp); // Update the AR processor with current broadband output level
        return tmp * outputGain; // Apply output gain
    }
};





#endif
