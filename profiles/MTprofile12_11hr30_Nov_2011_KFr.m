function x = MTprofile12_11hr30_Nov_2011
%created: 12_11hr30_Nov_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [21.5      18.5      57.7      38.1      28.1      53.9];
x.ShortTone = [23.5      21.9      61.1      47.9      30.1      57.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
35.4	35.3	78.8	25	54.9	55.2	 
43	51.2	83.4	22	65.2	61.7	 
89	86.6	88.8	5.1	70.6	66.2	 
96.2	92.7	93.8	38.5	79.4	61.8	 
101	96.8	96.6	28.7	85.5	68.7	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
43.1	47.9	76.3	11	73.4	47.1	 
40.1	37.2	76.9	19.7	79.4	35.4	 
36.6	33.3	78.7	-0.389	56.6	46.9	 
35.9	34.4	78.2	29.4	49	59.3	 
35.7	36.2	79.3	-10.5	58.9	93.7	 
34.5	49.7	82.3	20.5	92.2	95	 
36.9	82.2	82.9	-18.2	98.1	93.9	 
];
x.IFMCs = x.IFMCs';
