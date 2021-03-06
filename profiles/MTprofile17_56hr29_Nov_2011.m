function x = MTprofile17_56hr29_Nov_2011
%created: 17_56hr29_Nov_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [16.3      13.3      41.4      32.4      20.8      76.1];
x.ShortTone = [17.9      16.5      50.2      40.6      26.1      94.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
29.6	30.1	72.8	41.7	45.9	NaN	 
35.8	46.8	57.5	35.1	51.1	NaN	 
61.2	85.9	45.8	24	56.7	NaN	 
93.4	90.2	80.7	37.7	71.3	NaN	 
98.3	92.9	60.8	44.1	80.8	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
32.8	45.7	15.7	56	74.3	91.6	 
30.5	32.8	19.9	65.9	81.1	94	 
29	30.1	38.7	68.1	52.2	NaN	 
28	28.5	42.9	38.9	42	NaN	 
28.6	30	78.2	25.9	41.2	NaN	 
27.7	42.2	75	18.7	76.9	NaN	 
30.9	82.2	82.7	20.6	96.5	NaN	 
];
x.IFMCs = x.IFMCs';
