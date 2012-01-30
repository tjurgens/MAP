function x = MTprofile16_39hr27_Jan_2012
%created: 16_39hr27_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [32.9      29.3      22.7      13.2      22.6      27.3      35.1];
x.ShortTone = [34      31.3      24.3      17.1      31.7      32.7      43.2];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
57.4	58.7	49.8	21.9	35.7	37.8	42.3	 
78.6	76.6	63.6	20.7	31.8	42	54.4	 
95.6	87.8	73.7	39.1	40.3	48.8	47.4	 
104	98.2	79.1	41	58	65.9	54.5	 
NaN	101	89.4	33.4	56.7	55.3	57.9	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
62	75.1	74.2	69.1	72.3	83.3	83.4	 
62.9	64.2	65.7	43.3	77.6	86.2	42.2	 
56.7	57.3	52.7	24	32.8	43.5	29.7	 
54.3	55.5	47.1	15.7	38.7	38.4	46.7	 
57.3	60.7	53	28	35.2	45.3	55.4	 
55.5	79.5	83.6	81.5	73.5	71	101	 
70.6	85.5	89.9	89.7	95.8	102	NaN	 
];
x.IFMCs = x.IFMCs';
