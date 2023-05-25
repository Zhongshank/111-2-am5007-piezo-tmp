% Pieso HW8
% 4.
n = 20 ; fs =1000;  % n  = N
                    % fs = sampling frequency
mf = 100 ; sf =80 ; % mf = maximum frequency 
                    % sf = filter frequency
sn = 0 ;
n1 = zeros(1,n); r1 = zeros(1,n);
r0 = zeros(1,n);

% Step1 
for i = 1:n
    sn= (i-1)*mf/fs/(n-1);
    if sn <= sf/fs
        n1(1,i) =1 ;
    elseif sn >sf/fs
        n1(1,i) =0 ;
    end

end

% step2
r1 = ifft(n1);
r1 = real(r1);

% step3
rn(1,1:n/2) = r1(1,n/2+1:n);
rn(1,n/2+1:n) = r1(1,1:n/2);

%step4
w = 0:0.001:1;
n = 0:19;
for i = 1 : length(w)
    X(i) = 0;
    for k = 1:length(rn)
        X(i)=X(i)+rn(k).*exp(-1i.*w(i).*n(k));
    end
end
plot(w,X);
title('DTFT');
