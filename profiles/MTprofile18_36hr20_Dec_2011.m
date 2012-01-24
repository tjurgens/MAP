function x = MTprofile18_36hr20_Dec_2011
%created: 18_36hr20_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [16.5      11.4      13.7      15.4      20.7      26.2];
x.ShortTone = [18.7      12.9      13.8      15.6        25      30.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
26.3	21.2	21	17.9	30.7	41.2	 
33.5	27.2	28.8	25.8	50.1	51.5	 
50.2	40.6	43.4	45.7	82.6	70.9	 
84.4	83	62.2	69.2	NaN	79.7	 
NaN	NaN	NaN	107	NaN	92.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	52.6	37.7	43.2	73.5	58.7	 
NaN	33.8	28.2	29.5	44.3	46.8	 
30.5	23.6	19.5	19.3	31.6	38.6	 
28.1	22.1	21.3	17.5	30	40.5	 
25.2	22	20.4	18.6	33.7	43.6	 
25.8	27.7	29.8	27.4	39.6	57.1	 
33.5	41.6	47.5	46.6	78.3	82.9	 
];
x.IFMCs = x.IFMCs';