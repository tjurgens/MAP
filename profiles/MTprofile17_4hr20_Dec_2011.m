function x = MTprofile17_4hr20_Dec_2011
%created: 17_4hr20_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [15.5      10.4      9.03      12.5      19.9      26.2];
x.ShortTone = [18.7      12.6      12.2      14.9      24.2      30.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	39.9	56	55.8	35	39.6	 
76.3	78.9	81.1	82	69.1	58.4	 
NaN	NaN	NaN	99.8	NaN	NaN	 
NaN	NaN	NaN	NaN	NaN	NaN	 
NaN	NaN	NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	40.9	49.7	71.3	58.5	 
NaN	61.5	41.5	54.2	55.9	45	 
NaN	37.3	37.4	31.8	34.1	42	 
47.9	37.5	56.3	54.9	34.2	39.6	 
38.6	37.7	58.7	49.2	37.8	43.5	 
39.5	50.4	61.9	56.1	50.7	55.4	 
57	88.1	91.7	99	103	89	 
];
x.IFMCs = x.IFMCs';
