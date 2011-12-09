function x = MTprofile17_30hr30_Nov_2011
%created: 17_30hr30_Nov_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [16.7      14.1      14.9      49.3      61.4       NaN];
x.ShortTone = [18      15.7      22.8      58.2      70.1       NaN];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
28.6	30.7	22.7	62.3	78.9	NaN	 
38.2	39.6	26.4	70.3	80.1	NaN	 
56.3	66.3	25.6	72	83	NaN	 
61.2	60.6	40.2	70.3	89.5	NaN	 
85.1	77.1	42.5	79.4	92	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
33.5	64.5	70.3	76.1	84.5	NaN	 
34.2	44.7	36.4	78.3	89	NaN	 
30.4	33.5	23.8	63.1	77.5	NaN	 
27.8	29.8	16.4	58.1	79.8	NaN	 
29.1	31.6	20.7	58.9	90.5	NaN	 
28.6	40.5	37.2	88	103	NaN	 
38.7	76.2	86.9	96.4	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
