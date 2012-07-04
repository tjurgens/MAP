function x = MTprofile_MC_12_59hr04_Jul_2012
%created: 12_59hr04_Jul_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [29.1      22.9      21.8      24.3      30.9      55.6];
x.ShortTone = [31.3      26.2      24.7      27.1      34.4      60.1];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
42.8	38.5	42.2	49.1	55	74	 
49.1	51.8	62.2	70.8	67.3	79.8	 
89.2	82.1	84.8	75.8	71.6	88.3	 
97.1	92	93.5	81.2	82.7	94.4	 
100	95	96.8	88.2	87.2	96.6	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
50.6	64.8	72.1	71.2	72.5	83.6	 
47.5	51.8	60.3	70.7	77.7	87.4	 
44.7	41.6	45.4	48	62.1	76.9	 
43.6	39.3	43.6	54.6	44.5	73.3	 
43.3	39.3	47	59.3	58.4	81.7	 
41.7	45.7	81.8	87.1	92.4	96.9	 
45.8	78.7	87.5	91.8	97.1	102	 
];
x.IFMCs = x.IFMCs';
