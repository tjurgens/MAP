function x = MTprofile10_48hr02_Dec_2011
%created: 10_48hr02_Dec_2011

x.BFs = [250   500  1000  2000  4000  6000];

x.LongTone = [26.8      25.2      3.61      7.19      14.5      39.7];
x.ShortTone = [30.6      27.5      6.22       9.9      17.9      52.7];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
43.3	39.1	20.1	38.2	35.8	39.6	 
49.3	46.2	29.4	42.1	43.7	37.6	 
82.5	73.7	60.6	64.6	45.1	53.1	 
94.9	86.3	81.8	70	68.6	43.7	 
99.3	89.7	87.4	81	77.6	60.8	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
46.6	59.5	67.2	70.8	73.6	23.2	 
44.4	48.6	40.7	63.4	79.4	15.6	 
43.1	41.3	20.2	26.4	42.7	31.5	 
42.1	38.7	20.6	25.6	34.8	38	 
41.6	38.2	19.3	27.3	30.6	60.3	 
42	41.9	34.1	65.8	63.4	77.4	 
46.4	64.2	83.9	91.5	98.1	92.8	 
];
x.IFMCs = x.IFMCs';
