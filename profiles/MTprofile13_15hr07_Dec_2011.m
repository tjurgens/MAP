function x = MTprofile13_15hr07_Dec_2011
%created: 13_15hr07_Dec_2011

x.BFs = [250   500  1000  2000  4000];

x.LongTone = [69.2      59.9      58.4      61.1      78.2];
x.ShortTone = [70.7      62.3      61.6      65.1      80.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000];
x.TMC = [
94.6	84.5	81.5	83	93.5	 
101	90.7	91	84.2	96.4	 
105	94.5	92.2	89.4	98.5	 
NaN	96.3	97.4	93.3	101	 
NaN	99.9	99.5	96.8	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000];
x.IFMCs = [
98.7	91	82.3	75.8	77.3	 
98.8	88.5	84.3	77.5	83.3	 
95.7	84.3	84.2	81.4	89.3	 
95.5	84.5	80.3	81.4	92.8	 
94.2	86.8	84.4	83.4	99.2	 
91.9	87.5	88	88	104	 
91.2	86.6	92.7	95.5	NaN	 
];
x.IFMCs = x.IFMCs';
