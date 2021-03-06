function x = MTprofile0_11hr26_Jan_2012
%created: 0_11hr26_Jan_2012

x.BFs = [250   500  1000  2000  4000];

x.LongTone = [39.4      37.2        51      69.4      75.3];
x.ShortTone = [43.1      42.9      59.5      74.9      81.9];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000];
x.TMC = [
54.7	54.2	72.2	89.6	96.5	 
60.1	65.5	69.7	94.9	104	 
65.9	72.3	73.6	101	NaN	 
82.8	69.5	78.8	NaN	NaN	 
83.1	76.5	82.4	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000];
x.IFMCs = [
59.1	73.1	76.9	91.3	94.8	 
58.6	64.9	74.2	92.2	97.4	 
50.2	53.9	69.6	90.6	98.7	 
48.2	58.9	65.6	90.8	98	 
48.6	59	72	94	103	 
49.5	80.3	86.9	102	NaN	 
60.5	85	92	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
