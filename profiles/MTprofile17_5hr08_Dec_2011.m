function x = MTprofile17_5hr08_Dec_2011
%created: 17_5hr08_Dec_2011

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [15.1      12.8      12.4        30      43.3      46.3      37.7];
x.ShortTone = [16.7      14.7      15.2      46.8      57.3      53.4      46.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
32.3	36.1	21.2	41.9	59.8	54.5	42.8	 
37.1	49.2	29.7	27.1	58.2	60.6	49.6	 
67.6	59.9	28.5	40.6	63.9	65.5	47.8	 
88.5	79.1	40.5	45.5	71.8	60.4	47.9	 
101	91	35.8	26.6	73.8	75.2	56.3	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
34.6	66.1	71	72.1	80.5	85.8	80.2	 
33.3	48.9	42	69.8	83.5	89.3	92.4	 
35.8	34.4	20.9	50.9	73	66.2	49.3	 
30	34.6	20.9	42.1	56.3	50.7	36.8	 
33.6	34.8	19.5	45.2	57.3	57.8	43.4	 
32.6	45.4	37.5	52.8	94.2	90.9	87.6	 
44.5	82.9	86.5	93.1	102	NaN	106	 
];
x.IFMCs = x.IFMCs';
