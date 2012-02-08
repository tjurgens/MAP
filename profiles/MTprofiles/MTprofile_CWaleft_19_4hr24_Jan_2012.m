function x = MTprofile_CWaleft_19_4hr24_Jan_2012
%created: 19_4hr24_Jan_2012

x.BFs = [250   500  1000  2000  4000  6000  8000];

x.LongTone = [27.7      23.9        33        44      50.2      53.6      70.9];
x.ShortTone = [30      27.1        35      46.8      53.5      58.3      74.7];

x.Gaps = [0.01      0.03      0.05      0.07      0.09];
x.TMCFreq = [250   500  1000  2000  4000  6000  8000];
x.TMC = [
42.1	41	76	69.6	68	73.5	82.4	 
61.7	52.1	77.6	72	76.1	79.1	82.1	 
90.8	87.7	81.8	79.8	78.2	81.8	93.5	 
99.2	92.3	88	87.9	86.4	90.5	88.3	 
102	96.7	89.8	96.6	90.7	98.9	96.5	 
];
x.TMC = x.TMC';

x.MaskerRatio = [0.5      0.7      0.9        1      1.1      1.3      1.6];
x.IFMCFreq = [250   500  1000  2000  4000  6000  8000];
x.IFMCs = [
50.5	64.5	66.8	72.1	73	81.8	79.6	 
46.5	49	57.7	73.5	79.7	84.3	65.3	 
44.2	41.3	48.9	71.5	76.4	77	67.9	 
43	39.7	55.5	66.8	69.7	71.9	80.5	 
42.1	41.1	79.7	77.2	76.5	78.6	92.8	 
41.6	76.9	82.8	85.5	91.9	96.3	96.7	 
42.3	80.1	89.2	92.8	97	101	103	 
];
x.IFMCs = x.IFMCs';