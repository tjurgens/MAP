function x = MTprofile_RMeright_13_36hr06_Aug_2012
%created: 13_36hr06_Aug_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [14.5      11.1      7.73     -1.92      2.64      9.53];
x.ShortTone = [16.7      13.1        10      8.88      15.9      21.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
31	28.5	29.6	-7.09	6.76	7.88	 
44.8	43.6	42.2	-5.24	23.3	19.6	 
64.4	68.5	65	7.34	23.7	19.5	 
92.2	102	74.8	36.9	38.4	29	 
NaN	NaN	93.7	10.2	47.7	35.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	59.7	78.7	76.2	68.2	64.2	 
37.5	38.3	44.5	38.2	55.8	-11.8	 
32.6	28.7	27.1	-4.75	20	-7.84	 
31.4	29.1	26.9	5.48	14.2	5.53	 
29.4	30	27.8	14.1	18.1	28.7	 
29.2	36	53.3	30.9	53.8	53.6	 
37.7	54.5	75.3	72.9	71.9	55.5	 
];
x.IFMCs = x.IFMCs';