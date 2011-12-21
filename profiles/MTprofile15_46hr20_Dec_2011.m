function x = MTprofile15_46hr20_Dec_2011
%created: 15_46hr20_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [14.9      10.6      9.34      13.1      20.1      24.9];
x.ShortTone = [18.6      13.3      11.8      14.9      24.6      30.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	NaN	60.6	72	68.4	82.7	 
92	NaN	80.3	94.1	77.2	84	 
NaN	NaN	NaN	92.4	95.3	NaN	 
NaN	NaN	NaN	NaN	NaN	NaN	 
NaN	NaN	NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	41	45.8	77.1	75.5	 
NaN	NaN	37.7	37.7	65.2	59	 
NaN	68.3	42.5	36.5	42.8	60.5	 
NaN	69.5	57.7	73.3	72.5	74.9	 
NaN	NaN	68.2	56.4	78.4	72.4	 
49.4	72.2	59.6	51.4	64.7	NaN	 
NaN	NaN	87.5	75.6	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
