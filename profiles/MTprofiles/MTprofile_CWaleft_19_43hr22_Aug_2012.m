function x = MTprofile_CWaleft_19_43hr22_Aug_2012
%created: 19_43hr22_Aug_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [13      7.24      5.24      8.46      9.86      22.3];
x.ShortTone = [14.7      9.24       8.1      11.9      12.8      24.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
25.2	21	21.3	22.6	22	32.8	 
29.5	23.2	24.4	30	26.5	36.1	 
33.3	29.4	28.7	38	32.1	48.2	 
43.8	41.9	50.3	51.3	42.3	56.3	 
66.3	60	79.6	68.5	59.5	72.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	45.7	53.4	68.6	57.4	66.3	 
33.3	29	26.1	55.1	53.2	55.8	 
27	22.5	17.6	25.6	23.7	33.3	 
26.2	20.1	20.2	23.8	25.1	31.7	 
23.5	20.8	26.8	25.9	25.4	35.4	 
23	22.3	48	51	49.9	59	 
28	35	63.2	68.4	71.8	97.1	 
];
x.IFMCs = x.IFMCs';
