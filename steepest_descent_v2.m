function [x,y]=steepest_descent_v2(x_0, f, g, h, epoch)
e = 10^(-8); % Convergence Criteria
norm=1;
xler=[];
yler=[];
%x_0 = 0
%Initiliazation
iter = 0;
liste = [];
alpha = 0.8

%norm(g(x_0),2) >= tolerance & 
while norm>e & iter< epoch
    xler=[xler;x_0(1)];
    yler=[yler;x_0(2)];
    %x_new = x_0 - alpha * double(g(x_0(1))) %New solution
    x_new = x_0 - alpha * double(g(x_0(1),x_0(2))) %New solution
    
    alpha_new= secant(0.1,alpha,10^-8)
    
    alpha = alpha_new
    x_0 = x_new %Update old solution
    
    xx = [double(x_0)]
    x_0 = xx
    
    norm=abs(double(g(x_0(1),x_0(2))));
    liste = [liste; f(x_0(1),x_0(2))];
    iter = iter + 1
    
end
plot(xler,yler,'*-r');hold on;
x = 1:iter;
y = liste;
end