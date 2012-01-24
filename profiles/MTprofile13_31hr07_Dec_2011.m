function x = MTprofile13_31hr07_Dec_2011
%created: 13_31hr07_Dec_2011

x.BFs = [250   500  1000  1500  2000  2500  2750  3000  4000];

x.LongTone = [41.2        14      9.45      12.4      16.9      40.5      38.2        32      44.4];
x.ShortTone = [45.8      16.4      12.5      18.3      30.3      56.9      59.8      47.5      62.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  1500  2000  2500  2750  3000  4000];
x.TMC = [
63.9	40.3	42.6	26.2	25.7	23.7	51.4	32.4	56.3	 
65.7	53.4	53.1	37	34	53	64.4	44.9	71.4	 
71.8	71.5	66.3	42.7	43.2	52.5	70.5	46.3	66.1	 
71.7	78	70.3	57.4	50.8	69.1	78	61	81.6	 
74.5	91.6	81.7	56.6	52.4	63.4	80.4	52.5	79.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  1500  2000  2500  2750  3000  4000];
x.IFMCs = [
72	72.8	72.6	71.4	69.2	69.5	73	71.9	78	 
68.3	58.8	51	41	44.7	24.9	76.2	75.6	69.2	 
61.2	48.3	33.6	30.7	16.6	21.3	67.9	34.3	54.7	 
62.6	37.6	35.9	21.8	18.3	46.6	48.4	35.4	57.3	 
63.6	34	42.6	25.4	19.6	43	47.6	33.5	86.2	 
55	35.6	84.3	83.5	71.5	90.9	45.2	64	97.1	 
36.1	52.7	89.1	90.2	94	93.2	96.4	93.7	102	 
];
x.IFMCs = x.IFMCs';