function [y]=bernkst_sv(x,vcModelFkt,mData)

%% Kostenfunktion, wenn Sprachverstaendlichkeiten in mData stehen und nicht 0 oder 1

vModelled     = feval(vcModelFkt, mData(1,:), x);

%y =  sum((mData(2,:)-vModelled).^2);

y = - sum(   mData(2,:)  .* log(max(1e-200,   vModelled ))  + ...
          (1-mData(2,:)) .* log(max(1e-200,(1-vModelled)))        );




