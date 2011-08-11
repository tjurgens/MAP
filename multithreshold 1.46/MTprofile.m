function x = MTprofile
x.BFs = [250   500  1000  2000  4000  8000];
x.LongTone = [22      17.4      15.7      15.1      20.1        26];
x.ShortTone = [25.3      22.5      18.4      19.2      25.8      31.8];
x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [	36.8	38.9	36	37.8	48.8	45.5	 
44	43.6	38.3	42	52.1	48	 
49.5	51.3	49.8	50.2	62.7	53.3	 
54	54.4	52	73.1	68.1	51.8	 
61	71.4	56.9	73.3	72.4	57.3	 
];
x.TMC = x.TMC';
x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [	60.7	75.2	79.7	75.3	75.5	84.2	 
49.2	64.1	69.6	75.9	82.2	88.1	 
37.5	41.7	35.8	50.5	54.2	49.5	 
37.6	38.4	37.9	37.1	53.2	45.2	 
39.1	36.2	37.1	47.4	42.9	47.5	 
40	39.4	55.5	84.7	61.7	87.6	 
53.1	82.7	83.6	89.9	98.5	101	 
];
x.IFMCs = x.IFMCs';
