function [tfr,tf2,tf3] = reassignment(x,t,h,N)

[xrow,xcol] = size(x); [trow,tcol] = size(t);
[hrow,hcol]=size(h); Lh=(hrow-1)/2;
% create and initialize three arrays to zero
% these arrays have as many rows as frequency bins,
% and as many columns as time intants
tfr=zeros(N,tcol); tf2=zeros(N,tcol); tf3=zeros(N,tcol);
% compute th and dh
Th=h.*[-Lh:Lh]'; Dh=dwindow(h);
% compute the three STFTs
for icol=1:tcol,
 ti= t(icol);
 tau=-min([round(N/2)-1,Lh,ti-1]): ...
     +min([round(N/2)-1,Lh,xrow-ti]);
 indices= rem(N+tau,N)+1;
 % normalization to preserve energy
 norm_h=norm(h(Lh+1+tau));
 tfr(indices,icol)=x(ti+tau).*conj( h(Lh+1+tau))/norm_h;
 tf2(indices,icol)=x(ti+tau).*conj(Th(Lh+1+tau))/norm_h;
 tf3(indices,icol)=x(ti+tau).*conj(Dh(Lh+1+tau))/norm_h;
end ;
% final call to the FFT function
tfr=fft(tfr); 
tf2=fft(tf2); 
tf3=fft(tf3);
avoidw=find(tfr~=0); 
tf2(avoidw)=round(real(tf2(avoidw)./tfr(avoidw)/Dt));
tf3(avoidw)=round(imag(N*tf3(avoidw)./tfr(avoidw)/(2.0*pi)));
tfr=abs(tfr).^2;