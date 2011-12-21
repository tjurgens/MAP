function x = MTprofile15_41hr20_Dec_2011
%created: 15_41hr20_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [14.8      9.79      8.59      11.8      22.4      24.7];
x.ShortTone = [18.9      13.1      11.7      15.6      24.6      30.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	66.7	56.9	76	69.7	77.8	 
NaN	96.4	83.4	84.6	74.9	81.9	 
NaN	NaN	NaN	NaN	88.9	94.4	 
NaN	NaN	NaN	NaN	NaN	NaN	 
NaN	NaN	NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	39.2	43.5	79.8	75.8	 
NaN	NaN	41.5	32	68	58.1	 
NaN	58	38.9	41.1	44.1	58.4	 
NaN	64.2	56.3	71.8	66.4	80.7	 
NaN	NaN	68.4	52	74.5	81.4	 
51	54.7	61.5	56.6	64.9	NaN	 
NaN	NaN	81.5	85.6	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
