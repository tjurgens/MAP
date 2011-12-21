function x = MTprofile13_7hr20_Dec_2011
%created: 13_7hr20_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [15.9      10.8      9.21      11.7      20.3      25.5];
x.ShortTone = [18.6      12.6        12      15.7      24.9      33.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	52.8	54.5	56.7	41.4	6.74	 
NaN	82	80.8	71	51.8	11.7	 
NaN	98.8	NaN	84.6	37.3	13.4	 
NaN	NaN	NaN	NaN	60.9	-4.1	 
NaN	NaN	NaN	NaN	77.8	16.8	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	46.9	24.9	20.6	-1.96	 
NaN	NaN	38.1	28.7	25.2	18.9	 
NaN	44.3	37.5	35.6	30.2	21.1	 
NaN	NaN	51.9	50.3	38.3	17.3	 
NaN	51.8	49	57.7	73.6	1.97	 
NaN	50.3	57	62	47.4	34.8	 
NaN	66.6	91.3	NaN	81.8	27	 
];
x.IFMCs = x.IFMCs';
