function x = MTprofile17_9hr06_Aug_2012
%created: 17_9hr06_Aug_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [14.7      8.18      8.01      8.39      16.1      25.4];
x.ShortTone = [16.6      10.7      8.69      11.3      18.5      28.1];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
33	26.6	21.9	27.5	31.3	39.9	 
49.3	41	25.9	38.8	45	49.5	 
75.6	76.7	45.3	72.5	59.3	68	 
NaN	NaN	80.9	90.7	93	98.1	 
NaN	NaN	NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	59	41.1	56.8	63.6	55.7	 
45.1	30.6	23.3	49.2	46.8	44.8	 
33.8	26.4	22.1	24.5	30.9	35	 
32.9	27	21.7	26.1	33.5	36.2	 
29.4	26.6	22.6	29.4	34.3	37.9	 
28.3	30.2	28	40.4	45.5	66.4	 
32.9	49.4	60.6	79.2	76.5	98.2	 
];
x.IFMCs = x.IFMCs';
