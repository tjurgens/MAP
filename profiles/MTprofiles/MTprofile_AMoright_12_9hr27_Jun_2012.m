function x = MTprofile_AMoright_12_9hr27_Jun_2012
%created: 12_9hr27_Jun_2012

x.BFs = [250   500  1000  2000  4000  6000];

x.LongTone = [14.2      11.5      10.6      19.8      38.5        62];
x.ShortTone = [15.4      13.1        13      32.7      47.6      77.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
36.8	44.5	28.2	30.9	49.3	78.4	 
57.2	63.5	41.8	38.2	57.8	67.1	 
87.3	79.6	53.5	33.2	55.2	85.1	 
NaN	96.2	66.1	31.7	67.9	85.7	 
NaN	103	84.2	53.2	69.8	84.2	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
49.4	68.3	72.7	71.6	74.4	84.9	 
45.4	54.7	50.8	43.3	80.9	57.4	 
38.8	38.1	34.8	18.9	47.7	40.1	 
36.5	47.2	27.9	23	40	61.6	 
36.2	47.7	46.1	37	52.9	59.2	 
33.4	82.3	84.8	58.3	92.9	101	 
43	87.8	89.4	91.2	101	NaN	 
];
x.IFMCs = x.IFMCs';
