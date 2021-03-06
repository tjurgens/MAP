function x = MTprofile12_2hr06_Dec_2011
%created: 12_2hr06_Dec_2011

x.BFs = [250   500   750  1000  2000];

x.LongTone = [23.7      24.8      34.5        55       103];
x.ShortTone = [29.7      32.4      45.7      69.1       104];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500   750  1000  2000];
x.TMC = [
26.5	26.6	41.5	77.5	NaN	 
32.6	27.5	44.9	80	NaN	 
39.8	46.8	48.8	78.2	NaN	 
40.1	43.3	56.6	85.6	NaN	 
38.6	58.4	50.7	85.5	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500   750  1000  2000];
x.IFMCs = [
27.8	60.8	73.8	65.8	100	 
25.5	44.9	43.2	54.6	NaN	 
24.9	36.7	36.1	56.5	NaN	 
23.9	25.5	26.5	76.4	NaN	 
21.9	34.4	31.3	84.9	NaN	 
21.4	36.1	41.3	89.2	NaN	 
34.9	63.4	56.5	97.5	NaN	 
];
x.IFMCs = x.IFMCs';
