function x = MTprofile_KFrright_11_1hr24_Feb_2012
%created: 11_1hr24_Feb_2012

x.BFs = [6000];

x.LongTone = [22.2];
x.ShortTone = [26.4];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [6000];
x.TMC = [
40.4	 
44.1	 
62.1	 
81.3	 
NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [6000];
x.IFMCs = [
78.1	 
76.5	 
34.2	 
39.1	 
71	 
97.9	 
104	 
];
x.IFMCs = x.IFMCs';
