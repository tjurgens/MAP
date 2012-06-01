function x = MTprofile_OHCloss4e_16_53hr16_May_2012
%created: 16_53hr16_May_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [14.1      9.98      9.11      10.9      18.6      24.1];
x.ShortTone = [17.6        12      11.4      15.4      22.3      29.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
NaN	61.7	45.6	52.7	43.4	62.2	 
73.8	88.8	86.6	64.7	53.4	68.3	 
98.4	106	90.7	87.6	62	84.5	 
NaN	NaN	NaN	NaN	71.3	87.6	 
NaN	NaN	NaN	NaN	104	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
NaN	NaN	37.7	42.1	52.5	47.2	 
NaN	NaN	37	41.5	41.9	43.2	 
NaN	NaN	29.6	52.3	35.8	47	 
NaN	90.4	41.7	52.1	45.7	56.4	 
47.7	77.6	45	49.4	46.4	61.6	 
NaN	NaN	67.3	69.7	55.5	NaN	 
45.6	NaN	85.9	87.8	77.5	NaN	 
];
x.IFMCs = x.IFMCs';
