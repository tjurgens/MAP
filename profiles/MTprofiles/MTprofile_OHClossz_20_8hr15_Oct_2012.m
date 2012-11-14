function x = MTprofile_OHClossz_20_8hr15_Oct_2012
%created: 20_8hr15_Oct_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [19.4      12.6      11.6      13.8      20.1      24.6];
x.ShortTone = [21.5      15.2      14.6      16.8      23.6      27.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	43.6	40.9	38.1	52.1	50.3	 
NaN	76.9	69.2	46.8	57.9	67.5	 
NaN	94	98.9	66.7	75.9	77.7	 
NaN	NaN	NaN	99.5	86.6	88.7	 
NaN	NaN	NaN	NaN	101	104	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	54.1	39.9	32.1	34.2	38	 
NaN	52	38.9	34.8	39.9	38.8	 
NaN	43.1	38.7	36	41.6	50.9	 
NaN	43.3	40.4	38.4	46.9	62.9	 
NaN	44.7	41.8	40.5	47.1	71.9	 
54.9	47.5	49	55.7	69.4	NaN	 
54.1	66.4	82.1	90.9	90.7	NaN	 
];
x.IFMCs = x.IFMCs';