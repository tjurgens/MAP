function x = MTprofile20_35hr26_Jan_2012
%created: 20_35hr26_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [15.7      12.2      3.04      6.39      13.7      16.2      31.3];
x.ShortTone = [17.2      14.5      5.26       9.3        16      22.1      35.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
28.8	26.9	19.5	40.4	38.2	41.4	50	 
37.3	41.7	26.3	56.1	43.7	58.5	67.5	 
68.4	66.3	49.7	69.6	57.4	64.2	77	 
98	87.5	87.9	75.5	71.5	77.9	75.8	 
100	94	95.3	84.9	83.5	95.6	90	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
37.7	54.7	67.1	71.8	73.7	81	81.6	 
33.1	42.8	39.4	72.5	79.2	85.6	34	 
29.4	30.4	20.1	35.3	41.6	50.3	36.7	 
28.7	27.4	18.9	43.7	39	44.1	52.4	 
28.2	28.1	23.6	51.5	41.3	56.4	64.7	 
27.8	35.4	55.9	87.5	94.4	99.1	98.1	 
29.1	81.6	86.6	94.1	97.9	104	NaN	 
];
x.IFMCs = x.IFMCs';
