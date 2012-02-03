function x = MTprofile_Normal_16_5hr02_Feb_2012
%created: 16_5hr02_Feb_2012

x.BFs = [1000];

x.LongTone = [64.4];
x.ShortTone = [72.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [1000];
x.TMC = [
79.4	 
83.2	 
94.4	 
97.3	 
98.7	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [1000];
x.IFMCs = [
82.5	 
77.8	 
79.8	 
82	 
79.5	 
85.3	 
90.8	 
];
x.IFMCs = x.IFMCs';
