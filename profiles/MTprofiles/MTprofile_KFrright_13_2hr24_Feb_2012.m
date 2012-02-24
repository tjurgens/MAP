function x = MTprofile_KFrright_13_2hr24_Feb_2012
%created: 13_2hr24_Feb_2012

x.BFs = [250   500  1000  2000  4000  6000 8000];

x.LongTone = [34.9      25.9      19.3     -9.11       6.4      3.83   28.3];
x.ShortTone = [38      27.2      27.4      3.53      9.98      8.75  35.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000];
x.TMC = [
44.8	38.4	28.7	11.5	21.7	24.3	 
46.6	42	40	6.48	32.7	34	 
55.3	53.6	46.3	22.7	50.1	44.5	 
71.2	76.9	48.5	36.5	70.6	65.7	 
93.3	92	53.7	42	81.4	79.3	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000];
x.IFMCs = [
NaN	71.2	62.4	32.8	42.2	57	 
NaN	52.4	46.7	36.1	48.7	44.6	 
48.3	38.3	34.1	22.9	23.4	19	 
44.4	37.1	29.5	6.61	23.6	21.3	 
41.5	33.1	34	-0.863	26.6	27.9	 
45	38.9	38.8	-9.09	57.5	51.2	 
55.9	56.9	40.9	-9.81	89.1	85.5	 
];
x.IFMCs = x.IFMCs';
