function x = MTprofile13_4hr04_Jul_2012
%created: 13_4hr04_Jul_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [48.9      55.2      56.6      46.8      53.1      74.1];
x.ShortTone = [51.5      57.8      59.5      50.7      56.9      78.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
63.4	75.7	82.9	72.9	74.6	95.2	 
74.7	83.7	93.1	75.9	80.8	96.2	 
93.7	90.5	97	80.3	82.5	99.3	 
101	94.1	99.8	83.5	89.3	NaN	 
102	96.5	104	91.2	93.4	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
69.6	80.4	83.6	70.9	74.1	87.7	 
66.5	78.5	82.4	73.6	79.2	90.3	 
65.4	75.2	83.1	71.2	77.3	92.9	 
63.8	75.8	83.8	69	73.9	95.1	 
63.8	76.2	84.1	73.8	82.8	95.5	 
64.9	77.8	88.9	83	90.2	101	 
73.5	82.7	95.3	90.2	97.3	NaN	 
];
x.IFMCs = x.IFMCs';
