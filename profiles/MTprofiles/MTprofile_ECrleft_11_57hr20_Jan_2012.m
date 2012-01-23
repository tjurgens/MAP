function x = MTprofile_ECrleft_11_57hr20_Jan_2012
%created: 11_57hr20_Jan_2012

x.BFs = [250   500  1000  2000];

x.LongTone = [64.4      61.4      78.2      98.4];
x.ShortTone = [66.5      64.1      80.4       104];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000];
x.TMC = [
90.3	87.2	102	NaN	 
95.8	91.4	NaN	NaN	 
99.3	94.6	NaN	NaN	 
NaN	100	NaN	NaN	 
NaN	99.1	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000];
x.IFMCs = [
96.3	87.1	79.4	91.2	 
90.1	84.1	89.6	NaN	 
91	87.3	97.4	NaN	 
89.6	88.3	103	NaN	 
88.8	90	104	NaN	 
85.5	92.2	NaN	NaN	 
85.8	100	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
