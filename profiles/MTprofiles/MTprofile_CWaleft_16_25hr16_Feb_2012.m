function x = MTprofile_CWaleft_16_25hr16_Feb_2012
%created: 16_25hr16_Feb_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [22.5      19.3      27.1      39.8      43.4      56.7      61.3];
x.ShortTone = [31.2      27.4      35.1      49.9        54      68.4      73.9];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
37.6	34.2	40.2	50.2	51.6	66.6	78.3	 
37.9	37.1	45	56.6	54	74.3	81.5	 
46.3	51.6	60.9	63	55.7	78.8	87.6	 
61.9	90.7	62.4	71.3	64.1	82.5	92.1	 
95.1	94.7	79.9	72.9	74.5	91.7	98.1	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
45.8	55.9	54.6	67.7	68.8	76.4	83.3	 
43	43.1	39.5	67.5	75.7	78.8	88.3	 
39.4	35.8	37.6	54.5	55.8	73	79.6	 
37.4	33.5	39.6	51.7	52.7	69.1	78.5	 
35.3	34.7	78.2	59.6	60.5	76.4	83	 
34.1	45.2	80.7	79.8	85.1	91.4	98.7	 
34.8	81	85.5	87	92.7	95.5	101	 
];
x.IFMCs = x.IFMCs';
