function x = MTprofile_KFrright_10_37hr24_Feb_2012
%created: 10_37hr24_Feb_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [41.1      38.6        50      26.1      14.8      48.1];
x.ShortTone = [42.4      40.7        59      38.1      17.8      57.6];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
54.7	54.9	73.9	43.1	33.5	40.4	 
58.2	64.1	76.2	46.1	50.1	44.1	 
72.6	84	77.5	46	65	62.1	 
93.6	91.7	80.9	54.8	71.8	81.3	 
97.5	97.3	81.1	71.5	77.2	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
61.3	69	73.8	61.1	73.3	NaN	 
57.4	59.2	72.8	65.8	79.7	NaN	 
55.2	53.6	75.6	69.6	42.4	34.22	 
53.9	54.1	74.5	40.3	30.3	39.10	 
53.6	54.9	74.6	26.4	40.6	70.97	 
53.6	75.1	76.1	17.5	93.9	97.93	 
55.3	79.3	76.1	22.2	97.1	104.12	 
];
x.IFMCs = x.IFMCs';