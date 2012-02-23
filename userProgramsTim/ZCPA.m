function [zcpa,zcpa_bin_center,functionSpecific] = ZCPA(bm,method,params)

% MAP module for zero crossings with peak amplitudes (ZCPA) calculation
%
% Guy J Brown University of Sheffield
%

%
% Required parameters:
%
%   params.BFlist               list of best frequencies (Hz)
%   params.ti_decay             time constant of the one-pole lowpass filter (ms)
%   params.compression		kind of compression (log, cuberoot, squareroot, hist or none)
%
%   Note that "hist" forms an unweighted interval histogram (no energy, just a count of intervals)
%
% Required method fields:
%
%   method.plotGraphs
%   method.dt
%   method.subPlotNo
%   method.numPlots
%   method.nonlinCF
%

BFlist = params.BFlist;
functionSpecific = [];

% initially assume a fixed window size

% find the zero crossings
    
hop_size = round(params.hop_size_msec/(method.dt*1000.0)); % 10 msec hop size
%longest_window_length = round(10/(method.dt*BFlist(1))); % longest window is 10 periods of the lowest BF
longest_window_length = 0.025/method.dt;
maxframe = fix((size(bm,2)-longest_window_length+hop_size)/hop_size)-1; % maximum frame number

zcpa = zeros(params.numfreqbins,maxframe);

%zcpa_bin_center = logspace(log10(BFlist(1)),log10(BFlist(end)),params.numfreqbins);
zcpa_bin_center = logspace(log10(200),log10(3500),params.numfreqbins);

for chan=1:length(BFlist),
    
    %window_length = round(10/(method.dt*BFlist(chan))); % window is 10 periods of channel BF
    window_length = longest_window_length;
    
    % this is inefficient but I can't think of a way of vectorizing it
    % probably need to resort to an m file
    %
    % make a table of all the zero crossings in this channel of the form (time,freq,peak amp)
    
    % find the positive-going zero crossings in this channel
    
    zct = find(diff(bm(chan,:)>=0)==1);
    
    % linearly interpolate to improve accuracy (suggested by Rob Mill)
    a=bm(chan,zct);
    b=bm(chan,zct+1);
    zct = (zct-1+a./(a-b)); 
    
    % on occasion may get a zero crossing index less than one (due to interpolation), so fix this
    
    zct(zct<1)=1;
    
    % make a table of zero crossings
    
    zctab=[];
    zctab(:,1)=zct(1:end-1)';                       % this is the time location of the zc in samples
    zctab(:,2)=1./(diff(zct).*method.dt)';          % frequency corresponding to the period 
    for k=1:length(zct)-1,                          % computes the peak amplitude between this zc and the next one
        zctab(k,3)=max(bm(chan,round(zct(k)):round(zct(k+1)))); 
    end 
    
    % add compression to the peak amplitude if required
    
    
    switch lower(params.compression)
        case 'log'
            zctab(:,3)=log10(1+zctab(:,3));
        case 'cuberoot'
            zctab(:,3)=zctab(:,3).^0.3;
        case 'squareroot'
            zctab(:,3)=zctab(:,3).^0.5;
        case 'none'
            % do nothing
        case 'hist'
            zctab(:,3)=1; % unweighted interval histogram
        otherwise
            error('Compression must be log, cuberoot, squareroot or none');
    end
    
    % do the framing
    
    for frame=1:maxframe,
        st=1+(frame-1)*hop_size;
        fn=st+window_length;
        % find the points within this frame
        inwindow = find(zctab(:,1)>=st & zctab(:,1)<fn);
        % find the corresponding bins in the zcpa
        bins = interp1(zcpa_bin_center,1:params.numfreqbins,zctab(inwindow,2),'nearest','extrap');
        % if a valid bin, add to the zcpa
        % can't vectorise this because the same element may be modified by
        % more than one index
        for k=1:length(bins),
            if (~isnan(bins(k)))
                zcpa(bins(k),frame)=zcpa(bins(k),frame)+zctab(inwindow(k),3); % add power to this zcpa bin
            end
        end
    end
    
end

if method.plotGraphs
	method.subPlotNo=method.subPlotNo+1;
	% multi-channel plot
    plotGuide.figureNo=method.figureNo;
	plotGuide.subPlotNo=method.subPlotNo;
	plotGuide.dt=method.dt;
	plotGuide.numPlots=method.numPlots;
	plotGuide.yValues=zcpa_bin_center;	% for 3D plots
	% 	
	plotGuide.yLabel='bin frequency (Hz)';
	plotGuide.xLabel='time (s)';
	
	plotGuide.title='ZCPA';
    plotGuide.displaydt = method.dt;
	UTIL_plotMatrix(zcpa, plotGuide)

end
