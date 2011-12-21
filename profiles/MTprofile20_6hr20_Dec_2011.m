function x = MTprofile20_6hr20_Dec_2011
%created: 20_6hr20_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [17.6      11.5      11.8      13.7      21.1        27];
x.ShortTone = [18.3        13      12.7      15.2      24.8        30];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
44.3	26.6	42.3	37.8	42.2	40.4	 
53.9	47	56.4	61	71.5	48.4	 
86.2	82.7	80.1	83.7	85.6	62.8	 
104	95.7	NaN	103	101	71.3	 
NaN	NaN	NaN	NaN	NaN	82.5	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	37.4	47.1	71.1	58.9	 
NaN	44.2	32.1	29	55.8	45.1	 
NaN	27.3	25.8	24.8	35.4	44.1	 
45.4	26.5	32.7	25.9	40.6	39.9	 
29.7	26.2	38.7	30.2	47.5	42.6	 
29.6	32.8	43.2	40.6	44.2	59	 
36.2	52.6	67	53.2	84.3	88	 
];
x.IFMCs = x.IFMCs';
