function x = MTprofile_JDoright_12_20hr25_Jan_2012
%created: 12_20hr25_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000];

x.LongTone = [29.2      25.8      32.3      31.9        48      76.7];
x.ShortTone = [30.1      28.3      41.2      41.4      59.1      85.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
53.2	53.1	53.5	38.3	62.1	90.7	 
61.8	68.9	58.8	17.1	72.7	95.8	 
85.1	79.9	57.7	41.1	74.5	93.2	 
93.8	85.6	68.7	47.8	76.1	100	 
NaN	96.6	79.1	48.8	82.8	99.3	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
62.4	75.4	70	70.3	83.2	87.4	 
56.8	65.7	65.2	48.1	87.2	84.2	 
51.9	56.6	52.1	21.7	81	73.1	 
51.1	51.1	49.8	30.9	69.2	93	 
45.4	60.7	62.8	10.9	74.4	102	 
52.7	81.8	84.2	55.9	98.5	106	 
63.3	87.3	88.7	88.7	105	NaN	 
];
x.IFMCs = x.IFMCs';
