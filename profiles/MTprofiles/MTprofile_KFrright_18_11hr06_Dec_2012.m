function x = MTprofile_KFrright_18_11hr06_Dec_2012
%created: 18_11hr06_Dec_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [41      38.3      47.1      24.2      12.8        20      45.6];
x.ShortTone = [43.6      40.6        57      31.4      16.9      23.1      59.6];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
55.9	53.1	72	27.5	33.9	32.3	65	 
68.9	64.5	74.5	38.7	57.2	38.4	52.3	 
92.8	83.1	73.6	37.4	62.1	52.5	75.8	 
96.6	92.7	74.9	47.3	78.2	73.7	51.9	 
100	96.7	78.4	43.4	85.2	77.1	89.6	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
63.6	66.2	70.4	49.4	74.4	79	22.9	 
60.4	58.3	71.6	68.1	79.6	36.7	18.7	 
57.6	53.9	71.8	38	48.3	28	37.4	 
55.4	54.3	71.2	26.5	39.1	33.5	51.2	 
55.8	55.4	72.6	22.7	43	50.6	58.7	 
56.2	74.8	73.1	16.1	94.1	98.1	94.7	 
59	79.1	72.1	12.1	98.4	104	82.5	 
];
x.IFMCs = x.IFMCs';
