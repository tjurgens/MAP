function x = MTprofile17_26hr30_Nov_2011
%created: 17_26hr30_Nov_2011

x.BFs = [250   500  1000  2000  3000  4000];

x.LongTone = [16.6     -1.69      24.1        27      26.4      44.5];
x.ShortTone = [26.7      4.04        23      30.4        30      45.9];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  3000  4000];
x.TMC = [
25.2	11.9	10.1	46.7	44.6	54.9	 
25.7	10.6	5.21	49.9	47.1	57.4	 
36.5	17	20.3	55.2	51.9	59.7	 
41.3	21.3	16.6	59.5	55.3	62.9	 
45.1	46.6	43.2	64.7	60.5	65.6	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  3000  4000];
x.IFMCs = [
45	25.7	31.1	67.7	52.4	53.1	 
43.5	17.6	18.8	51.2	50.6	47	 
26.5	4.82	2.04	44.2	42.8	53.1	 
30.4	8.24	12.5	45.2	44.2	54.2	 
34.6	9.26	3.88	47.9	44.9	57.3	 
18.9	16	22.6	48.8	49.5	56.7	 
26	61.7	44.7	52	55	62.5	 
];
x.IFMCs = x.IFMCs';
