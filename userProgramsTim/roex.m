function W = roex(p,r,g)
%rounded exponential filter shape as in Patterson et al., JASA 1982
%input: g: relative notch bandwidth (usually a vector [-0.4:0.01:0.4])
%       p, r: fitparameter        
%       W: output function

W = (1 - r)*(1 + p.*abs(g)).*exp(-p*abs(g)) + r;