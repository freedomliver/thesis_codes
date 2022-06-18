function [cfun,G] = Legendre_fit(xx,yy)
% Legendre fit
%
% xx: cos(theta)
% yy: data
%
% cfun: fitting result
% G: fitting goodness

mm=mean(yy);
% define the y - fit type and fit option
fy  = fitoptions('Method','NonlinearLeastSquares',...
    'Lower',[-3*abs(mm),-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf],...
    'Upper',[3*abs(mm),Inf,Inf,Inf,Inf,Inf,Inf,Inf,Inf,Inf],...
    'StartPoint',[mm,mm/4,0,0,0,0,0,0,0,0]);
fty = fittype(['a+b.*Legendre(1,x)+'...
                'c.*Legendre(2,x)+'...
                'd.*Legendre(3,x)+'...
                'e.*Legendre(4,x)+'...
                'f.*Legendre(5,x)+'...
                'g.*Legendre(6,x)+'...
                'h.*Legendre(7,x)+'...
                'm.*Legendre(8,x)+'...
                'n.*Legendre(9,x)'],...
                'options',fy);
[cfun,G] = fit(double(xx),double(yy),fty);

end