function x = profile_ARA_L									
x.Comments= {									
	};								
x.BFs= [   									
	250	500	1000	2000	4000	6000	8000		
	];								
x.LongTone= [ 									
	19.0	13.28	44.3772	36.5944	18.9495	NaN	28.5395		
	];								
x.ShortTone= [ 									
	32.1092	24.77	49.44	41.98	22.28	NaN	27.44		
	];								
x.IFMCFreq= [									
	250	500	1000	2000	4000	6000			
	];								
x.MaskerRatio=[    									
	0.5	0.7	0.9	1	1.1	1.3	1.6		
	];								
x.IFMCs=[									
    NaN	49.5784	78.4888	81.4795	72.3425 NaN
    NaN 44.2822	75.7745	72.8376	55.5732 NaN
    NaN 36.344	73.6905	61.9553	42.309 NaN
    NaN 27.4954	62.0056	57.0386	36.4364 NaN
    NaN 22.5381	70.1208	75.215	57.1095 NaN
    NaN 35.1003	79.3435	83.4629	91.2006 NaN
    NaN 68.6907	88.3573	NaN	NaN NaN		
	];								
x.IFMCs= x.IFMCs';									
x.Gaps= [									
	0.01	0.03	0.05	0.07	0.09
	];								
x.TMCFreq= [									
	500	1000	2000	4000	
	];								
x.TMC= [									
	35.43	75.57	56.60	36.66
    46.45	85.23	58.53	49.59
    67.57	74.98	75.36	46.82
    86.06	90.82    NaN    NaN
	NaN     79.49	NaN     NaN
	];								
x.TMC = x.TMC';									
