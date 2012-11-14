function x = MTprofile_JEleft_18_50hr20_Aug_2012
%created: 18_50hr20_Aug_2012

x.BFs = [250   500  1000  2000  4000  8000];

x.LongTone = [21.3        16      13.4      11.6      13.2      55.6];
x.ShortTone = [21.9      15.6      14.8      12.1      14.6      56.3];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  8000];
x.TMC = [
28.2	24.8	26.2	22.4	20.6	56	 
35.5	29.2	32.3	26.4	25.8	57.3	 
44	37.8	36.7	33.9	32.6	61.6	 
53	44.5	46.9	42.5	36.7	67.5	 
65.1	59.3	63.2	52.6	49.7	72.1	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  8000];
x.IFMCs = [
48.9	43.7	46.8	47.8	41.9	11.2	 
33.7	28.6	30.6	40.2	36.4	35.1	 
28.7	23.9	24.4	23.7	21.1	51.4	 
28.7	24.5	24.2	21.3	21	49.6	 
27.2	23.7	25.4	20.8	21.3	60.9	 
27.6	26.3	36.1	36	36.4	87.1	 
34	35.9	48.3	50.3	54.5	80.4	 
];
x.IFMCs = x.IFMCs';