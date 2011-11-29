function x = MTprofile12_42hr28_Nov_2011
%created: 12_42hr28_Nov_2011

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [46.5      45.4      39.6      41.3      44.9      50.3];
x.ShortTone = [55.5      52.6      47.3      47.3        52      57.7];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
69.4	67.9	58.5	62.4	61	73	 
78.4	76.1	69	68.7	68.6	75.3	 
79.2	88	77	80.4	82.2	81.4	 
90.6	95.8	87.7	86	84.6	87.1	 
NaN	NaN	NaN	91.7	88.8	97.4	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
74.5	84.6	82.4	78.9	76.9	84.1	 
71.7	76.9	75.2	77.6	84.7	89.5	 
72.2	68.5	63.3	66.2	69.4	71.9	 
68.1	66.7	58.5	60.6	64.5	71.2	 
69.3	69.7	60.2	67.7	65.5	71.7	 
77.8	74.9	71.3	84.9	85.4	91.3	 
82.2	84.5	86.8	94.2	101	101	 
];
x.IFMCs = x.IFMCs';
