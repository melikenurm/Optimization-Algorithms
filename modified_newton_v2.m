function [x,y] = modified_newton_v2(x_0, f, g, h, epoch)
liste = [];
alpha = 0.9;
xler=[];
yler=[];
M = 10^-2
e = 10^(-8); % Convergence Criteria
identity = eye(length(x_0))
i = 0;
norm=1;
while norm>e & i<epoch & M>=0 
    %[value,vector] = eig(h)
    xler=[xler;x_0(1)];
    yler=[yler;x_0(2)];
    x_new = x_0 -alpha*inv(h(x_0(1),x_0(2)) + M*identity)*g(x_0(1),x_0(2))
    %x_new = x_0 -alpha*inv(h(x_0(1)) + M*identity)*g(x_0(1));
    
    while(f(x_new(1),x_new(2)) >= f(x_0(1),x_0(2)))
    %while(f(x_new(1)) >= f(x_0(1)))
        if h(x_0(1),x_0(2)) > 0% positive definitive
        %if h(x_0(1)) > 0% positive definitive
            %G = (value+M_1)*vector
            G = h(x_0(1),x_0(2))
            %G = h(x_0(1)) + M*identity
        else
            %h(x_0(1),x_0(2)) = -1*h(x_0(1),x_0(2))
            G = h(x_0(1),x_0(2)) + M*identity
            %G = -h(x_0(1)) - M*identity
        end
        x_new = x_0 -alpha*inv(G)*g(x_0(1),x_0(2))
        %x_new = x_0 -alpha*inv(G(x_0(1)))*g(x_0(1))
        alpha_new = secant(0.1,alpha,10^-8)
        alpha = alpha_new
        M = M + 10^-5
    end
    x_0 = double(x_new)
    norm=abs(double(g(x_0(1),x_0(2))));
    liste = [liste; f(x_0(1),x_0(2))]
    %liste = [liste; double(f(x_0(1)))]
    i=i+1
end
plot(xler,yler,'*-r');hold on;
x = 1:epoch
y = liste;
end

