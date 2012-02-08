function x = MTprofile_JEleft_11_59hr25_Jan_2012
%created: 11_59hr25_Jan_2012

x.BFs = [250   500  1000  2000  4000];

x.LongTone = [35.9      34.1      33.5      44.5      59.9];
x.ShortTone = [37.2      35.4      37.3      53.4      66.6];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000];
x.TMC = [
51.5	57.8	42.8	54.4	80.1	 
64.4	67.4	49	55	83.5	 
80.5	81.9	61.2	66	82.8	 
85	80.3	60.8	66.2	90.7	 
97.3	93.4	67.6	69.5	86.1	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000];
x.IFMCs = [
61.9	76.1	72.7	70.8	85.5	 
62.5	66.8	53.8	67.3	88.7	 
58.5	55.6	43.7	56.4	78.2	 
56.1	62.6	48	56.1	79.8	 
57.9	68.3	52.6	73.2	85.5	 
52.8	82	79.3	89.5	101	 
67.8	87.2	88.8	98	106	 
];
x.IFMCs = x.IFMCs';