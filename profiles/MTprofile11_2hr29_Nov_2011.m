function x = MTprofile11_2hr29_Nov_2011
%created: 11_2hr29_Nov_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [48.4      44.3      42.5      44.8      53.3      57.8];
x.ShortTone = [50.6      47.1      45.3      47.9      56.6      61.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
60.9	60.4	60.6	67.1	74.1	73.5	 
67.5	75.4	66.4	72.2	78.5	75.9	 
91.2	86	85.2	73.9	76.1	80.7	 
95.1	90.6	89.4	84.3	86.4	88.5	 
97.6	93.8	93.1	88.1	94.2	90.5	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
64.9	73.2	73.4	70.8	74.2	82.1	 
62.3	66.2	67.9	72.5	79	85.8	 
62.4	59.9	60.7	66.2	78.3	78.9	 
61.7	61.9	59.6	62.4	73.1	72	 
62	61.1	61.5	66.1	70.4	74	 
63.2	66.8	75.3	83.5	91.3	92.8	 
74.7	79.4	85.2	90.1	96.2	99.8	 
];
x.IFMCs = x.IFMCs';
