% syms omg R
% syms R
syms omg

M=0.001122; eta=0.0545; K=874.515; theta=0.0007073;
Cp=10.5; F0=50*0.0006;

P = @(omg,R)((theta*omg*R).^2*F0^2)/(2*R.*(1+(Cp*omg*R).^2).*((eta*omg+omg*theta^2*R/(1+(Cp*omg*R).^2)).^2+(K-omg^2*M+(Cp*(omg*theta*R).^2)/(1+(Cp*omg*R).^2)).^2));

% omg = 1000;
figure (1)
for i=1:20
%     omg = 10^i;
% R = i*0.00001;
% R = 10^(i-10);
R = i*(0.000005)+0.0001;
% div=(1+(Cp*omg*R).^2);
% P = ((theta*omg*R).^2*F0^2)/(2*R.*div.*((eta*omg+omg*theta^2*R/div).^2+(K-omg^2*M+(Cp*(omg*theta*R).^2)/div).^2));
Pz = P(omg,R);
f = fplot(Pz,[800 1000]);
maxP(1,i) = max(f.YData);
hold on
end
legend ('1','2','3','4','5','6','7','8','9','10')
hold off

figure (2)
plot(maxP);
[optP,optRind] = max(maxP);
% optR = 10^(optRind-10);
% optR = optRind*(0.00001)+0.00005;
optR = optRind*(0.000005)+0.0001;

figure (3)
PtF = P(omg,optR);
freq = omg/(2*pi);
fplot(freq,PtF,[135*2*pi 150*2*pi])

% fplot(P,[10 10000])
% fsurf(div,[0 10 0 30])
% fsurf(P,[0 10 0 100])
