function [RIT,entropy] = rit_entropy(c)
% t is relative information transmitted
% c is the confusion matrix with rows: presented phoneme, columns:
% recognized phoneme (as usually used)
% Make sure that the confusion matrix has equal row-sums!
n=sum(sum(c));
p_i=sum(c,1)'/n;
p_j=sum(c,2)'/n;
p_ij=c'/n;
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
    RIT=0;
else
    RIT=hxy/hx;
end

%compute the entropy (in bits) phoneme-specific
for iCounter = 1:size(c,1)
     Hx= c(iCounter,:)./sum(c(iCounter,:)).* ...
         log(c(iCounter,:)./sum(c(iCounter,:)))./log(2);
     Hx(find(isnan(Hx)))=0;
     entropy(iCounter) = -sum(Hx);
end