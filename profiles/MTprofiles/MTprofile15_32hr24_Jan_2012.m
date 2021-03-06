function x = MTprofile15_32hr24_Jan_2012
%created: 15_32hr24_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000];

x.LongTone = [63.9      57.5      56.9      60.1      46.7      80.4];
x.ShortTone = [66.3      60.8      58.9      61.8      51.8      84.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
94.5	89.3	83.4	82	68.7	99.2	 
99.4	94.2	89.9	87.2	72.2	NaN	 
103	97.7	95.2	91.2	75.2	NaN	 
NaN	101	99	97.3	78.4	NaN	 
NaN	NaN	103	NaN	89.2	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
98.2	93.1	83.2	76.4	74	83.8	 
96.3	89.1	80.9	78.1	79.5	89.3	 
96.5	88.5	80.8	80.5	76.3	98	 
94.2	88.7	83.3	82.1	63	101	 
93.2	87.7	82.2	83.6	67.4	103	 
90.8	88.8	86.4	88.5	91.5	NaN	 
91.4	93.2	92.3	95.4	97.4	NaN	 
];
x.IFMCs = x.IFMCs';
