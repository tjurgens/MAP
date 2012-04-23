function x = MTprofile13_42hr23_Apr_2012
%created: 13_42hr23_Apr_2012

x.BFs = [250   500  1000  1500];

x.LongTone = [33        41      64.5      88.8];
x.ShortTone = [44.7      48.1        69        91];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  1500];
x.TMC = [
32.8	35.9	77.5	NaN	 
23.6	49.7	85.1	NaN	 
44.9	42.4	83.2	NaN	 
46.5	53.3	85.9	NaN	 
58.2	63	88	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  1500];
x.IFMCs = [
19.2	51.2	87	NaN	 
19.8	26.8	85.1	NaN	 
29.5	34.2	81.1	NaN	 
29.4	28.5	79.7	NaN	 
30.8	26.9	81.3	NaN	 
24.5	38.3	90	NaN	 
42.3	76.9	98.1	NaN	 
];
x.IFMCs = x.IFMCs';
