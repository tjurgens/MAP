function x = MTprofile13_16hr06_Dec_2011
%created: 13_16hr06_Dec_2011

x.BFs = [250   500   750  1000];

x.LongTone = [64.8      63.8      73.9      80.3];
x.ShortTone = [65.1      66.2      76.4      84.1];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500   750  1000];
x.TMC = [
88.6	88.4	100	NaN	 
94.9	96	105	NaN	 
97.4	98.3	NaN	NaN	 
99.9	102	NaN	NaN	 
103	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500   750  1000];
x.IFMCs = [
96.4	86.7	83.1	82.3	 
92.2	84.1	89.1	91.2	 
86	85.1	95.5	99.8	 
88.1	88.2	99.8	104	 
86.7	91.9	102	NaN	 
86.5	95.1	NaN	NaN	 
86.5	105	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
