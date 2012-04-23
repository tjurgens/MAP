function x = MTprofile_SJoleft_14_39hr23_Apr_2012
%created: 14_39hr23_Apr_2012

x.BFs = [250   500  1000  1500];

x.LongTone = [31.5      31.9      62.5      89.6];
x.ShortTone = [37.9        38      67.7        91];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  1500];
x.TMC = [
28.8	19.9	79.1	NaN	 
36.9	31.6	81.5	NaN	 
30.2	38.7	84.6	NaN	 
49.4	45	85.5	NaN	 
60	31.7	86.7	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  1500];
x.IFMCs = [
31.3	42.6	88.1	NaN	 
36.8	21.1	86.9	NaN	 
18.8	28	79.7	NaN	 
27.3	32.1	77.9	NaN	 
26.8	18	83	NaN	 
25.8	24.3	92.5	NaN	 
24.3	49.3	97.7	NaN	 
];
x.IFMCs = x.IFMCs';
