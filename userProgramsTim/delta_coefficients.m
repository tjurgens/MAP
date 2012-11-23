%Features  <= Feature matrix (dim.1: features / dim.2: time frames)

 %   Features_D  = delta(Features',3);    %compute deltas
  %  Features_DD = delta(Features_D,2);   %compute double deltas
   % Features = [Features; Features_D'; Features_DD'];


%% Compute delta coefficients
function D = delta_coefficients(X,n)
D = zeros(size(X)); %initialize D
X = [repmat(X(1,:),n,1) ; X ; repmat(X(end,:),n,1)]; %boundary criterion
count = 0;
for i=n+1:size(X,1)-n
    count = count+1;
    D(count,:) = (-n:n)*X((-n:n)+i,:);
end
denom = (-n:n)*(-n:n)';
D = D./denom;
end
