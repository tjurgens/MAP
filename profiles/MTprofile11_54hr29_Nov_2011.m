function x = MTprofile11_54hr29_Nov_2011
%created: 11_54hr29_Nov_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [42.1      39.2      26.4      27.3      61.3       NaN];
x.ShortTone = [47.4      40.9      31.3      29.6        72       NaN];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
58.7	55.3	26.1	NaN	NaN	NaN	 
61.4	56.7	29.1	NaN	20.6	NaN	 
60.9	60.1	32.4	NaN	NaN	NaN	 
65	68.6	37.1	NaN	NaN	NaN	 
68.4	81.1	32.3	NaN	-2.44	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	NaN	NaN	8.72	NaN	 
NaN	73.6	61.5	NaN	-11.4	NaN	 
65.7	47.3	30.1	-11.4	-2.75	NaN	 
59.3	57	31.1	-9.39	NaN	NaN	 
53.9	45	26.9	-6.37	17.6	NaN	 
51.6	46	39.9	7.54	7.06	NaN	 
77.9	89.3	NaN	-26.6	8.21	NaN	 
];
x.IFMCs = x.IFMCs';
