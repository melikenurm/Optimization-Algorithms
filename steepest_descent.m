function [x,y]=steepest_descent(x_0, f, g, h, epoch)
%x_0 = 0
%Initiliazation
iter = 0;
liste = [];
alpha = 0.8
norm=1;
tolerance = 1e-8;

%norm(g(x_0),2) >= tolerance & 
while (norm > tolerance & iter < epoch)
    %x_new = x_0 - alpha * double(g(x_0(1))) %New solution
    x_new = x_0 - alpha * double(g(x_0(1),x_0(2))) %New solution
   
    alpha_new= secant(0.1,alpha,10^-8)
    
    alpha = alpha_new
    norm=abs(double(f(x_new(1),x_new(2))-f(x_0(1),x_0(2))));
    
    x_0 = x_new %Update old solution
    
    xx = [double(x_0)]
    x_0 = xx
    

    liste = [liste; f(x_0(1),x_0(2))];
    iter = iter + 1
    
end
if (norm< tolerance)
    fprintf('Minimum succesfully obtained...\n\n');
end

x = 1:iter
y = liste;
end