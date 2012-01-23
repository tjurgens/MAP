function x = MTprofile10_41hr06_Jan_2012
%created: 10_41hr06_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [16.9      14.3      15.2      47.5      52.8        52];
x.ShortTone = [18.4      16.2      22.4      57.9      66.8      60.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
27.9	30.4	20.3	61.5	73.6	61.5	 
35.6	38.5	22.2	57.7	75.6	62.6	 
49.3	53	25.5	67.1	82.6	69.4	 
52.5	71.3	37.3	76.4	83.8	80.3	 
88.5	80.3	39.5	74.2	86.8	71.1	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
32.7	63.2	70.3	74.8	84.6	90.2	 
32.6	49.1	39.5	78.3	88.7	92.9	 
28.3	33.7	17.8	65.6	82.8	69.1	 
32.4	27.3	17.9	61.9	74.3	60.6	 
30.8	28.3	22.1	63.2	76	61	 
30.5	40	36.5	85.8	99.5	97.4	 
39.6	76.9	84.8	95.7	104	NaN	 
];
x.IFMCs = x.IFMCs';
