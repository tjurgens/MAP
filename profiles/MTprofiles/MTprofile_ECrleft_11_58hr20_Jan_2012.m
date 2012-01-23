function x = MTprofile_ECrleft_11_58hr20_Jan_2012
%created: 11_58hr20_Jan_2012

x.BFs = [250   500  1000  2000];

x.LongTone = [68.4      64.8      81.6       105];
x.ShortTone = [69.5      66.4      83.9       NaN];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000];
x.TMC = [
87.3	81.6	98.9	NaN	 
99.5	96.2	NaN	NaN	 
NaN	101	NaN	NaN	 
NaN	NaN	NaN	NaN	 
NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000];
x.IFMCs = [
92.7	82.2	75.9	NaN	 
89.4	80.5	84.6	NaN	 
85.2	82.9	92.7	NaN	 
84.4	82.1	99.1	NaN	 
84.8	82.4	103	NaN	 
81.9	90.3	NaN	NaN	 
82.4	96.6	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
