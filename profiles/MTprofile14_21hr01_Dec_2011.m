function x = MTprofile14_21hr01_Dec_2011
%created: 14_21hr01_Dec_2011

x.BFs = [250   500  1000  2000];

x.LongTone = [65        61      76.2      98.6];
x.ShortTone = [67      63.3      79.1       102];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000];
x.TMC = [
90.6	86.3	101	NaN	 
96	93.2	NaN	NaN	 
100	97	NaN	NaN	 
NaN	97.8	NaN	NaN	 
NaN	100	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000];
x.IFMCs = [
98.1	86.6	78.6	90.8	 
94.8	85.3	86.2	103	 
93	85	95.7	NaN	 
91.3	86.4	98.3	NaN	 
89.8	87.6	103	NaN	 
89.4	92	NaN	NaN	 
87.9	97.7	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
