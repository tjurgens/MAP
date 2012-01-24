function x = MTprofile13_22hr06_Jan_2012
%created: 13_22hr06_Jan_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [6.69      5.07   -0.0101      14.2      9.34       6.7];
x.ShortTone = [10.9      8.25      3.19        22      18.1      15.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
20.6	20.5	1.05	26.3	18.4	19.6	 
19.1	30.5	4.34	38.3	27.6	27.3	 
32.3	42.4	2.71	66.8	30	32.1	 
46.8	65.6	7.66	90.9	33.4	35.5	 
58.2	67.2	14	NaN	44.5	42.8	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
28.2	54.1	61.1	75	NaN	57	 
25	39.1	25.8	80.1	83.7	79.8	 
19.3	30.8	4.42	26.6	36.4	27.4	 
18.4	25.3	-2.62	20.1	18.2	23.7	 
90.5	35	-9.17	33.4	25	15.6	 
18.9	31.4	-0.0137	56.4	90.7	NaN	 
36.8	NaN	73	90.9	NaN	54.4	 
];
x.IFMCs = x.IFMCs';