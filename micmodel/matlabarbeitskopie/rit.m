function t = rit(c)
% t is relative information transmitted
% c is the confusion matrix
n=sum(sum(c));
p_i=sum(c,2)/n;
p_j=sum(c,1)/n;
p_ij=c/n;
k=p_ij.*log(p_i*p_j./p_ij)/log(2);
% NaNs may occur because p_ij is zero - since these elenents will be zero anyway,
% find them and set them to zero
k(find(isnan(k)))=0;
% hxy is the mutual information in x and y
hxy = -sum(sum(k));
% compute the entropy, but need to check for NaNs on the way
hxm = p_i.*log(p_i)/log(2);
% again, may get Nan in cases where p_i is zero, so fix them
hxm(find(isnan(hxm)))=0;
% hxm is the entropy (self information) of x
hx = -sum(hxm);
% t is the relative information transmitted
if (hx==0)
    t=0;
else
    t=hxy/hx;
end

