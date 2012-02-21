function x = MTprofile_CWaleft_18_23hr15_Feb_2012
%created: 18_23hr15_Feb_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [22.3      18.9      27.2      40.3      42.8        56      60.9];
x.ShortTone = [30.2      27.1      35.2      50.3      55.1      70.3      74.1];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
35.8	38.1	33.8	NaN	NaN	NaN	NaN	 
38.4	51.1	34.4	NaN	NaN	NaN	NaN	 
40.5	83.6	35.7	NaN	NaN	NaN	NaN	 
59.6	95.9	38.9	NaN	NaN	NaN	NaN	 
93.6	99.9	46	NaN	NaN	NaN	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
44.9	66.3	46.3	NaN	NaN	NaN	NaN	 
41.4	51.6	34.8	NaN	NaN	NaN	NaN	 
37.6	40.1	31.7	NaN	NaN	NaN	NaN	 
35.9	39.3	34	NaN	NaN	NaN	NaN	 
34.8	38.7	39.7	NaN	NaN	NaN	NaN	 
33.8	79.2	79.7	NaN	NaN	NaN	NaN	 
33.2	83.2	81.3	NaN	NaN	NaN	NaN	 
];
x.IFMCs = x.IFMCs';
