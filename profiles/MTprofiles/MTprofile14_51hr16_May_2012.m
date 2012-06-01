function x = MTprofile14_51hr16_May_2012
%created: 14_51hr16_May_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [14.1      9.98      8.86      10.9      18.6      24.1];
x.ShortTone = [17.6        12      11.1      15.4      21.1      29.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	NaN	56.5	56.8	43.5	63.1	 
77.8	95.8	82.7	66.9	42.5	68.7	 
NaN	NaN	NaN	82.4	52.2	82.2	 
NaN	NaN	NaN	NaN	72.4	NaN	 
NaN	NaN	NaN	NaN	65.8	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	38.4	40.9	33.8	48	 
NaN	NaN	38.5	36.2	32.9	45.3	 
NaN	NaN	45.3	42.1	32.6	41.6	 
NaN	NaN	54.8	52.8	40.2	55.5	 
45.4	96.8	51.8	52.8	41.8	64.2	 
NaN	NaN	73.3	68.2	56.4	NaN	 
38.4	NaN	96.1	81.4	77.3	NaN	 
];
x.IFMCs = x.IFMCs';
