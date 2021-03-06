function x = MTprofile18_42hr27_Feb_2012
%created: 18_42hr27_Feb_2012

x.BFs = [250   500  1000  2000  4000];

x.LongTone = [13.8      1.03      7.31     -3.14      3.67];
x.ShortTone = [15.4      2.76      9.89      10.5      12.9];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000];
x.TMC = [
NaN	22.6	24.8	7.82	17.2	 
36.8	31	37	4.91	29.5	 
48.3	50.2	51	23.2	33.5	 
66.3	73.3	71.2	41.2	40.9	 
93	96	79.3	38.5	34.1	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000];
x.IFMCs = [
NaN	NaN	NaN	NaN	61.7	 
NaN	NaN	NaN	35.4	53.3	 
NaN	23.2	23.9	4.52	23.3	 
NaN	20.9	23.6	17.2	20.6	 
27.3	22.3	27.7	-2.03	16.2	 
33.8	40.7	46.6	37	31.1	 
43.4	NaN	73	64.4	44.1	 
];
x.IFMCs = x.IFMCs';
