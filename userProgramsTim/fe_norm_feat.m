function Featnorm = fe_norm_feat(Feat)
% row-wise normalization (variance 1, mean 0) of feature matrix

% Feat = load_htk('FAC_13A.htk',0,1);

m = mean(Feat,2);
m2 = repmat(m,1,size(Feat,2));
b = Feat - m2;
vs = sqrt(var(b,0,2));
vs2 = repmat(vs,1,size(Feat,2));
Featnorm = b./vs2;
