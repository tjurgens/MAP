function x = profile_JE_L_meas_aided

x.Comments= {									
	};								
x.BFs= [   									
	250	500	1000	2000	4000	6000	8000		
	];								
x.LongTone= [ 									
	16.50	13.83	13.95	18.84	21.73	NaN	69.38		
	];								
x.ShortTone= [ 									
	27.34	19.10	23.92	23.33	27.70	NaN	88.08		
	];								
x.IFMCFreq= [									
	250	500	1000	2000	4000	6000	8000		
	];								
x.MaskerRatio=[    									
	0.5	0.7	0.9	1	1.1	1.3	1.6		
	];								
x.IFMCs=[									
	NaN	51.64	51.28	71.30	68.45	NaN	NaN		
	NaN	36.77	28.98	64.79	48.68	NaN	NaN		
	NaN	28.27	31.70	50.15	36.08	NaN	NaN		
	NaN	26.28	31.00	39.89	33.69	NaN	NaN		
	NaN	25.69	40.00	36.37	32.34	NaN	NaN		
	NaN	27.35	48.42	44.38	47.80	NaN	NaN		
	NaN	44.12	63.64	88.05	100.25	NaN	NaN		
	];								
x.IFMCs= x.IFMCs';									
x.Gaps= [									
	0.01	0.02	0.03	0.04	0.05	0.06	0.07	0.08	0.09
	];								
x.TMCFreq= [									
	250	500	1000	2000	4000	6000	8000		
	];								
x.TMC= [									
	NaN	27.79	34.20	31.96	36.58	NaN	NaN		
	NaN	NaN	NaN	NaN	NaN	NaN	NaN		
	NaN	28.81	46.57	37.68	40.50	NaN	NaN		
	NaN	NaN	NaN	NaN	NaN	NaN	NaN		
	NaN	43.93	57.08	46.98	54.04	NaN	NaN		
	NaN	NaN	NaN	NaN	NaN	NaN	NaN		
	NaN	66.70	68.34	69.77	59.52	NaN	NaN		
	NaN	NaN	NaN	NaN	NaN	NaN	NaN		
	NaN	80.70	97.65	92.68	102.63	NaN	NaN		
	];								
x.TMC = x.TMC';									
