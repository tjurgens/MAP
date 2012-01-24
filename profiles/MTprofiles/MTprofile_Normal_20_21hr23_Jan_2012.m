function x = MTprofile_Normal_20_21hr23_Jan_2012
%created: 20_21hr23_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [7.22      4.85       3.3      5.75        13      19.7];
x.ShortTone = [9.78      6.77      6.16      8.36      16.1        22];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
22.6	19.4	20	21.4	30.1	34.7	 
27.1	23.3	27.2	26.2	32.3	37.3	 
43.4	37	36.4	29.4	34.6	37.9	 
89.3	57.3	78.6	36.7	38.5	42.9	 
98.8	91.5	95.6	45.9	41.3	47.2	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
28.9	34.8	42.9	47.6	52.4	57.5	 
26.1	27.3	31.1	34	42.6	46.6	 
23.1	20.7	20.5	22.8	31.2	35	 
22.1	19.8	20.5	22.5	28.1	35	 
21.4	20.7	23	26	33.4	39.3	 
21.2	24	32.4	39.1	48.7	54	 
23	34.4	46.5	57.7	65.4	74.2	 
];
x.IFMCs = x.IFMCs';