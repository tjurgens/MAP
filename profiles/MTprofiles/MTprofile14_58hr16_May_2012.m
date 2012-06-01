function x = MTprofile14_58hr16_May_2012
%created: 14_58hr16_May_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [15.4      9.98      9.61      13.1      19.3      25.8];
x.ShortTone = [18.8        13      11.6      16.2      24.5      29.1];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	71.2	55.6	65.8	74	60.9	 
85.1	100	80.5	84.5	80.7	69.1	 
NaN	NaN	NaN	NaN	93.7	75.1	 
NaN	NaN	NaN	NaN	87.9	92.4	 
NaN	NaN	NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	39.7	40.6	68.1	72	 
NaN	NaN	37.8	29.9	61.3	66.4	 
NaN	58.5	38.4	32.2	42.6	62.8	 
58.5	66.2	47.8	70	61.2	52.1	 
NaN	NaN	72.9	56.7	79	67.4	 
48.7	61.5	50.5	56.3	58.9	NaN	 
46.9	NaN	89.8	91.7	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
