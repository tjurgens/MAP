function x = MTprofile_KFrright_17_1hr06_Dec_2012
%created: 17_1hr06_Dec_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [7.56      7.09      45.6      23.9      13.2      21.2      47.1];
x.ShortTone = [9.03      9.68      53.1      33.6      17.1      24.3      88.4];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
21.3	25.9	85	45.1	45.3	33.5	103	 
26.5	33.8	81.8	33.5	55.4	47	103	 
56.7	82.3	82.3	74.4	67.7	63.3	NaN	 
92.2	94.1	81.9	51.5	77.2	69.2	NaN	 
99.7	95.9	81.4	46.2	85	84.5	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
27.8	25.1	66.4	57.9	74.6	80	83.6	 
24.5	21.1	60.1	66.8	80	59.9	79.1	 
22.2	20.8	68.2	67.9	46.6	30.9	100	 
21.3	22.1	80.7	35.5	44.3	45.5	103	 
19.4	27.6	82	19.6	51	60	103	 
19.5	41.5	86.5	17.4	95	99.3	NaN	 
21.2	84.1	88.1	15.9	98.3	103	NaN	 
];
x.IFMCs = x.IFMCs';