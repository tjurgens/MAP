function x = MTprofile12_31hr26_Apr_2012
%created: 12_31hr26_Apr_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [6.9      4.27       2.9      21.2      93.6       NaN];
x.ShortTone = [9.84      7.45      6.47      26.7      96.3       NaN];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
22	22.5	25.4	29.3	NaN	NaN	 
37	39.6	52.3	33.2	NaN	NaN	 
85.2	85.3	84.3	36.4	NaN	NaN	 
95.5	90.9	93	36.3	NaN	NaN	 
101	92.7	99.8	61.7	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
30.3	48.9	70.2	18.1	NaN	NaN	 
26.6	31.2	43.9	6.92	NaN	NaN	 
24.5	22.1	24.9	15.2	NaN	NaN	 
21.8	22.7	28.8	24.3	NaN	NaN	 
22	20.9	32.7	40.1	NaN	NaN	 
22.1	36.3	82.2	82.9	NaN	NaN	 
23.8	83.7	87.3	90.5	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
