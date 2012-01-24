function x = MTprofile_ARaleft_13_7hr17_Jan_2012
%created: 13_20hr17_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [13.2      8.33      13.5      15.2      14.9      13.9];
x.ShortTone = [17.6      7.82      15.6        18      19.3      17.9];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
31.6	24.4	29.7	37.8	30.9	30	 
45.1	29.7	36.5	46.6	44.5	32.4	 
71.1	47.9	46.3	53.4	57.7	41.8	 
94.5	77.4	59	63	67	49.4	 
NaN	86.9	62.6	62.3	75.5	65.8	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	53.8	72.9	40.6	55.7	79.1	 
NaN	31.3	44.3	45.6	64.3	80.5	 
34.8	24.5	31.1	36.8	29.2	33.7	 
33.7	23.7	30.1	29.2	31.4	28.7	 
30.7	11.9	31.7	40.7	39.6	32.4	 
33.2	3.62	46.9	68.1	53.4	56.4	 
32.9	14.7	61.4	78	98.4	NaN	 
];
x.IFMCs = x.IFMCs';