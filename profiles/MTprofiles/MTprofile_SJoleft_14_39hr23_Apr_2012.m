function x = MTprofile_SJoleft_14_39hr23_Apr_2012
%created: 14_39hr23_Apr_2012

x.BFs = [250   500  1000  1500];

x.LongTone = [31.5      31.9      62.5      89.6];
x.ShortTone = [37.9        42.6      67.7        91];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  1500];
x.TMC = [
37.1	46.1	79.1	NaN	 
38.1	56.5	81.5	NaN	 
52.5	60.4	84.6	NaN	 
61.3	58.1	85.5	NaN	 
65.7	73.4	86.7	NaN	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  1500];
x.IFMCs = [
39.9	66.1	88.1	NaN	 
37.6	50.7	86.9	NaN	 
35.9	45.5	79.7	NaN	 
35.7	38.4	77.9	NaN	 
26.6	34.6	83	NaN	 
30.1	63.3	92.5	NaN	 
40.5	86.8	97.7	NaN	 
];
x.IFMCs = x.IFMCs';
