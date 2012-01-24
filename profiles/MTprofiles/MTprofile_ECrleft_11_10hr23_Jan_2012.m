function x = MTprofile_ECrleft_11_10hr23_Jan_2012
%created: 11_10hr23_Jan_2012

x.BFs = [250   500  1000  2000];

x.LongTone = [58.7      54.5      81.5       NaN];
x.ShortTone = [58.5      55.7      83.5       NaN];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000];
x.TMC = [
54.8	52.8	83.4	NaN	 
54.4	54	83.7	NaN	 
56.7	57.7	88.1	NaN	 
57.2	59.5	97.7	NaN	 
59.5	70.5	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000];
x.IFMCs = [
60.2	64.1	57.1	NaN	 
58.7	58	76.3	NaN	 
55.8	54.1	80.5	NaN	 
54.4	53	83.4	NaN	 
52.7	53.2	84.8	NaN	 
51	59.1	90.1	NaN	 
48.9	76.2	99.1	NaN	 
];
x.IFMCs = x.IFMCs';
