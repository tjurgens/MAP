function x = MTprofile_CWaleft_13_12hr17_Feb_2012
%created: 13_12hr17_Feb_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [10.9       6.5     0.938      13.9      10.8      19.6      21.4];
x.ShortTone = [19.3      11.8      8.99      23.9      22.5        32      32.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
NaN	NaN	13.1	23.2	19.4	31.7	32.6	 
32.9	27	14.8	25.9	24.4	43.9	42.6	 
48.5	37.8	17.7	33.7	24.5	43.3	49.6	 
68.4	66.7	45.4	41.4	27.3	50.7	63.6	 
NaN	86.2	61	56.4	47	60	93	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
NaN	NaN	47.1	47.1	49	50.3	56.4	 
NaN	NaN	18.1	46.6	49	50.9	53.1	 
NaN	24.8	11.4	29.1	21	36.2	35	 
27.8	21.6	13.6	27.5	19.5	32.4	35.7	 
24.1	18.4	18.9	28.5	19.8	36.3	39.8	 
22.3	17.9	57.8	53.9	57.4	59	67.2	 
24.5	76.8	67.6	61.7	63	88.3	102	 
];
x.IFMCs = x.IFMCs';
