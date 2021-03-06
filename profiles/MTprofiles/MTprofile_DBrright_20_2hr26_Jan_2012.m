function x = MTprofile_DBrleft_20_2hr26_Jan_2012
%created: 20_2hr26_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [47.3        22      8.52        12      22.3      24.9      28.2];
x.ShortTone = [54.8      24.5      10.6      16.1      26.3      30.9      32.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
67.5	41.2	46.1	24.2	23.2	34.3	45.3	 
69.6	39.9	56.4	26	30.3	40.2	52	 
72.3	52.6	68.2	47.3	27	43	60.7	 
74	55.7	81.6	50.1	35	64.5	61.3	 
77.8	72.2	92.3	62.2	42.7	58.2	76.9	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
72.6	68.2	74.6	71.1	70.6	81.2	86	 
71.9	65.3	56.1	47.7	74.8	83.9	91	 
66.9	44.8	41.7	26.3	24.3	41.8	46.2	 
69	39.5	46	31.6	28.1	50	43.1	 
67.3	28.9	48.4	40.5	38.4	41.7	47.3	 
65.5	19.6	83.9	54.9	50.6	96	100	 
53.3	17.9	91.8	92.3	61.1	104	104	 
];
x.IFMCs = x.IFMCs';
