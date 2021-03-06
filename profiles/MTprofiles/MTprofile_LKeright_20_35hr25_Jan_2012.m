function x = MTprofile_LKeright_20_35hr25_Jan_2012
%created: 20_35hr25_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [62.9      57.7      57.2      59.1      28.6      69.6      73.4];
x.ShortTone = [65.6      59.8      59.6      61.2      33.4        74      75.8];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
91.9	81.7	83.4	81.3	62.6	91.3	93.4	 
97.4	92.5	92.2	84.7	71.3	96.1	93.5	 
103	95.6	95.6	88.3	69.3	97.5	96.1	 
104	97.8	99.6	93.8	72.5	99.7	99.5	 
NaN	100	NaN	101	92.2	NaN	101	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
96.1	88.5	84.7	75.6	72.5	86.3	82.8	 
94.4	85.8	83.6	78	80.4	88.4	87.3	 
92.5	85.1	84.6	80.9	53.3	89.8	89.7	 
91.6	85.7	84.2	81.9	54.8	91.4	90.1	 
91.6	85.6	86.5	83.5	65.8	92.8	91.4	 
88.7	86.6	88.6	89.1	92.9	97.2	98.2	 
86.6	90.3	93.9	95.2	99.2	102	104	 
];
x.IFMCs = x.IFMCs';
