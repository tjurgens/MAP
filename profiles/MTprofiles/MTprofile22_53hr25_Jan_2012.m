function x = MTprofile22_53hr25_Jan_2012
%created: 22_53hr25_Jan_2012

x.BFs = [250   500  1000  2000];

x.LongTone = [22.6      20.9      60.9       102];
x.ShortTone = [25.5      26.5      66.7       105];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000];
x.TMC = [
27.7	33.4	49.4	NaN	 
31.4	41.8	69.6	NaN	 
36.6	41.2	66.7	NaN	 
42.1	49.2	76	NaN	 
62.1	53.2	76.6	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000];
x.IFMCs = [
37.8	57	61.6	102	 
25.4	39.6	39	NaN	 
27.6	30.5	48.9	NaN	 
20.8	30.2	52.7	NaN	 
25.5	36.6	73.8	NaN	 
27.9	55.2	89.3	NaN	 
27	86.8	94.5	NaN	 
];
x.IFMCs = x.IFMCs';
