function x = MTprofile11_47hr06_Jan_2012
%created: 11_47hr06_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [6.03      5.15     -1.56      11.6      12.8         7];
x.ShortTone = [10.7      7.63      3.35      19.9      18.2      14.9];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
79.7	22.3	0.504	16.4	21.4	17.6	 
22.9	31.8	-2.55	28.3	24.7	23.6	 
29.6	41.3	14.7	31.6	35.7	25.8	 
43.5	48	7.28	27.9	34.3	32.8	 
55.4	68.8	14.2	36	35.7	31.8	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
26.3	51.5	60.1	57.5	47.4	41.2	 
26	38	24	33	44	48.2	 
19.4	21.2	2.76	24.1	34.8	27.8	 
17.3	23	2.03	20.4	22.7	9.26	 
97.7	30.6	-5.99	24.4	20.2	16.7	 
18.8	30.4	-1.87	40.7	52.1	67.5	 
40.6	74.8	53	51.9	61.4	93.4	 
];
x.IFMCs = x.IFMCs';
