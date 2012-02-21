function x = MTprofile_Normal_10_30hr16_Feb_2012
%created: 10_30hr16_Feb_2012

x.BFs = [4000];

x.LongTone = [13.5];
x.ShortTone = [27.7];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [4000];
x.TMC = [
24.1	 
25.2	 
24.5	 
27.4	 
30.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [4000];
x.IFMCs = [
77.4	 
44.3	 
21.8	 
23.9	 
20.9	 
31.9	 
101	 
];
x.IFMCs = x.IFMCs';
