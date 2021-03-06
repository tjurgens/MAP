function x = MTprofile_RMeright_aided_correctold
%created: 12_12hr23_Feb_2012
%the aided one
x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [13.6      1.18      8.66   -0.0138      7.67      71.3];
x.ShortTone = [15.2      2.54      9.82      10.3      18.3      80.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  ];
x.TMC = [
28.1	21.6	26.3	19.08	22.52		 
34.7	35.7	39.2	27.85	35.86		 
52.8	58.8	50.9	39.21	50.14		 
77.9	81.5	68.4	53.38	53.35		 
NaN 	NaN	82.5	48.62	68.18		 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  ];
x.IFMCs = [
NaN     56.7	63.5	NaN	71.06		 
37.5	34.0	40.8	49.47	61.24		 
29.1	24.9	24.3	1.65	27.14		 
27.5	23.1	29.0	8.38	27.62		 
28.4	23.2	29.0	20.98	19.83	 
25.8	29.7	37.9	37.30	50.55	 
32.3	50.5	60.7	84.64	93.05		 
];
x.IFMCs = x.IFMCs';
