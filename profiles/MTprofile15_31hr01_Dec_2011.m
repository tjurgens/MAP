function x = MTprofile15_31hr01_Dec_2011
%created: 15_31hr01_Dec_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [16.3      13.8      41.3      51.5        57      66.6];
x.ShortTone = [17.2        15      51.8      65.4      65.4      75.1];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
32.8	41.3	37	71.6	78.1	88.5	 
45.8	55	46.1	78.5	78.7	90.6	 
69.5	65.7	53.2	76.4	82.5	90.9	 
86	80.3	55.3	82.5	87.6	93.7	 
95	90.7	71.8	84.1	87.2	94.9	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
45.9	64.8	18	76.9	82.9	92.7	 
42.8	52.3	14.1	80.3	89.5	91.6	 
35.1	38.7	26.5	78.3	83	66.4	 
34.5	40.1	46.8	76.2	76.4	79.6	 
37.8	38.3	83.4	71	85.2	102	 
35.3	62.5	86.6	79.7	100	107	 
42.6	86.7	92.9	96.4	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
