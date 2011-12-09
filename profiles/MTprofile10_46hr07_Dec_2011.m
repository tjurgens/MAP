function x = MTprofile10_46hr07_Dec_2011
%created: 10_46hr07_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [66.3      62.5      63.8      12.7      85.3       104];
x.ShortTone = [69.7      66.2      65.9      17.9      88.1       NaN];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
90.9	82.1	86.9	26.7	103	NaN	 
99.9	90.5	94.1	52.7	NaN	NaN	 
103	94.9	96.6	65.8	NaN	NaN	 
NaN	98.5	101	68.8	NaN	NaN	 
NaN	101	NaN	83.8	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
93.7	84.6	87.6	71.5	77.9	NaN	 
95.5	83.4	87.4	72.8	91.3	NaN	 
91.9	84.6	87.3	46.5	100	NaN	 
94.9	84.8	88.7	35.2	103	NaN	 
92.3	82.4	88.1	36.3	NaN	NaN	 
90.1	84.3	89.2	48.7	NaN	NaN	 
89.9	81.9	88.7	90.6	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
