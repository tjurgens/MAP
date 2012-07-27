function x = MTprofile_CWaleft_18_43hr26_Jul_2012
%created: 18_43hr26_Jul_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [12.5      6.27      4.59      8.18      7.78      18.9];
x.ShortTone = [14.9      8.83       7.7      11.1      12.7      22.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
24.8	21	26.4	30	34.9	37.6	 
47.1	28.2	61.2	45.6	44.6	41.8	 
93.5	80.2	74	57.7	58.2	48.3	 
NaN	93.6	86.7	79.1	68.3	68.5	 
NaN	NaN	NaN	NaN	86.4	99.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
45.8	39.3	46.9	55.4	49.1	52.3	 
31.1	29	26.2	49.6	50	58	 
26.3	22.2	21.2	32.4	39.3	43.1	 
24.5	21.6	27.7	33.1	33.8	38.1	 
24.6	22.5	37.9	38.5	41.3	42.9	 
23.6	27.2	54.2	55.2	73.6	96.9	 
29.1	42.3	58.9	66.2	90.5	NaN	 
];
x.IFMCs = x.IFMCs';
