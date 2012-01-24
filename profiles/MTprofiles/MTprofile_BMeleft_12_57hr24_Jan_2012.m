function x = MTprofile_BMeleft_12_57hr24_Jan_2012
%created: 12_57hr24_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000 8000];

x.LongTone = [11.8      9.13       5.7      10.8      17.2      20.8    34.7];
x.ShortTone = [14      10.6      10.6      13.9      22.3      25.8     38.7];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
26.9	22.8	26.5	49.7	41.2	48	 
35.7	27.8	47.1	64.7	62.4	57.8	 
92	54.2	79.1	74.7	74.9	74.8	 
96.3	88.5	92	85	78.8	75.2	 
101	93.8	96.5	89.7	88.8	83.6	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
33.6	46.3	70	71.7	74.1	80	 
30.2	31.3	46.3	72.5	81.5	83.8	 
27.2	24	27.9	40.8	67.1	46	 
25.8	22.9	27.5	42.7	46.3	44	 
25.2	23.6	30.1	52.7	57.2	51.1	 
25.1	29.7	81.8	86.5	94.4	98.1	 
27.1	82.1	88.1	93.7	100	104	 
];
x.IFMCs = x.IFMCs';
