function x = MTprofile13_5hr13_Sep_2011
%created: 13_5hr13_Sep_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [16.6      12.1      8.96      9.53      13.8      20.2];
x.ShortTone = [18.6      16.2      12.2      13.8      19.3      25.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
40.1	36.2	36.6	41.5	36.6	35.9	 
38.7	43.9	42.6	41.3	41.8	37.6	 
46.8	51.4	49.4	48.2	43	40.8	 
53	57.7	53.8	52.7	50.8	42.4	 
59.3	68.4	62.2	54.6	50.8	53.8	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
45.5	58.9	67	75.4	80.8	82.7	 
44.2	51.3	49.5	56.6	63.5	70	 
37.1	42	36.6	46.4	38.7	40.7	 
35.8	38.5	34.4	40.4	35	36.6	 
34.3	37.3	34.1	43.3	36.3	38.2	 
37.7	41	46	54.8	55.2	57	 
39.8	48.1	62.7	75.3	83.8	94.1	 
];
x.IFMCs = x.IFMCs';
