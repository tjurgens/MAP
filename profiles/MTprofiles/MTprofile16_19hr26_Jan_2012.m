function x = MTprofile16_19hr26_Jan_2012
%created: 16_19hr26_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [15.4      12.6        12      33.9      49.4      57.4];
x.ShortTone = [16      14.4      14.7      48.7      57.2      68.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
36.7	47.3	31.6	43.2	61	73.7	 
47	61.7	33.2	47.9	68.6	77.3	 
81.8	78.7	47	60.1	66.9	82.4	 
99.3	88.2	59.4	67	72.1	71.6	 
104	96.8	68.3	72	77.7	87.7	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
44	70.8	67.9	73.3	81.5	91.1	 
43.2	52.6	42.3	49.7	87.2	80.2	 
35.9	45.6	28.4	37.6	73.9	54.1	 
35.6	41.6	26.1	34.3	70.7	70	 
33.7	45	34.4	49.4	65.6	96.7	 
40.1	81.5	82.6	89.8	96.3	106	 
42.3	87.2	89.6	96.5	102	NaN	 
];
x.IFMCs = x.IFMCs';
