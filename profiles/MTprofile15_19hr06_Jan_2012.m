function x = MTprofile15_19hr06_Jan_2012
%created: 15_19hr06_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [8.19      6.05     0.132      18.1      20.7      14.1];
x.ShortTone = [11.2      8.84      6.83      25.5      21.1      18.5];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
16.9	16.9	7.39	5.09	10.1	-6.56	 
21.6	25.9	10.2	2.66	9.03	-5.19	 
26.3	31.2	14.3	9.66	23.7	-0.747	 
33.3	38.6	13.3	28.7	30	5.5	 
47.3	55.5	11.3	33	35.1	-3.13	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
24.4	46.7	60.7	57.6	54.9	51.9	 
20.2	28.8	35.5	25.5	38.2	43.4	 
18	17.9	8.6	0.391	8.1	1.13	 
18.2	17.3	-0.333	-1.31	4.63	-11	 
22.3	20.7	-2.16	2.23	2.25	-12.5	 
16.4	27.3	3.76	24.1	29.6	7.39	 
29.2	43.5	21.9	56.1	57.2	30.8	 
];
x.IFMCs = x.IFMCs';
