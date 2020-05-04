function [x,y] = modified_newton(x_0, f, g, h, epoch)
liste = [];
alpha = 0.9;

M = 1e-2
identity = eye(length(x_0))
i = 0;
norm=1;
tolerance = 1e-8;
while norm>tolerance & i<epoch & M >=0
    %[value,vector] = eig(h)
    
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
        M = M + 1e-5
    end
    x_0 = double(x_new)
    norm=abs(double(g(x_0(1),x_0(2))));
    liste = [liste; f(x_0(1),x_0(2))]
    %liste = [liste; double(f(x_0(1)))]
    i=i+1
end
if (norm< tolerance)
    fprintf('Minimum succesfully obtained...\n\n');
end

x = 1:i
y = liste;
end

