function x = MTprofile14_40hr06_Dec_2011
%created: 14_40hr06_Dec_2011

x.BFs = [250   500  1000  2000  4000  6000];

x.LongTone = [14.6        13      11.8      31.7        48      99.8];
x.ShortTone = [15.6      14.2      14.6      43.4      57.5       102];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
28.5	31.4	19.2	28.4	61	NaN	 
39.2	48.3	27.2	40.4	65.5	NaN	 
59.9	62.8	31.7	48.1	66	NaN	 
87.2	79	41.7	34.1	73.3	NaN	 
NaN	89.8	55.1	44.3	78.3	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
34.3	66.7	69.4	69.8	78.8	NaN	 
28.6	48	41.9	48.2	84.4	NaN	 
30.1	39.3	23.7	28.9	61	NaN	 
30.1	32	21.2	26.7	56.7	NaN	 
30.7	33.7	18.9	21.1	76.6	NaN	 
33.9	45.5	30.4	45.6	99.5	NaN	 
36.2	82.8	86.2	91.4	103	NaN	 
];
x.IFMCs = x.IFMCs';