function x = MTprofile18_54hr10_Sep_2012
%created: 18_54hr10_Sep_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [31.3      25.2        23      16.1      18.7      51.9];
x.ShortTone = [32.2        26      24.4      17.4      19.9      62.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
38.7	33.9	35.3	28.5	27.7	67	 
43.5	39.4	40.1	32.6	32	67.6	 
52.7	45.7	44.5	42.8	40	74.4	 
62.8	55.2	56	50.5	48.8	77.5	 
77.9	74	75.3	66	51.8	85.1	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
59.5	52.8	56.4	58	45.3	22.1	 
44	38.8	41	48	41.7	40.8	 
39.6	34.1	34.1	30.4	29.2	54.2	 
37.8	33.8	34.6	26.7	27.5	67.2	 
37	33.2	34.8	28.2	29.5	87.2	 
37.1	35.4	42.3	42.7	44.7	107	 
43.1	45.8	53.9	58.5	63.6	NaN	 
];
x.IFMCs = x.IFMCs';
