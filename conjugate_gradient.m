function [x,y]=conjugate_gradient(x_0, f, g, h, epoch, betaRule)
%0-> default
%1-> hestenes_stiefel
%2-> polak_ribiere
%3-> fletcher_reeves
%4-> powell

vector = zeros(length(x_0),1)

if(g(x_0(1),x_0(2))~=all(vector == 0))
    d = -g(x_0(1),x_0(2))
else
    return;
end
liste = [];
i = 0;
% durma þartý
tolerance = 1e-8;
alpha = 0.09

while (norm(g(x_0(1),x_0(2)),2) >= tolerance && i < epoch)
    
    %alpha = -(transpose(g(x_0(1),x_0(2)))*d)/(transpose(d)*h(x_0(1),x_0(2))*d)

    alpha = secant(0.1,alpha,10^-8)%newton_alpha(alpha, 1)

    x_new = x_0 + alpha*d
   
    %beta
    if betaRule == 0 %default
        beta = (transpose(g(x_new(1),x_new(2)))*h(x_new(1),x_new(2))*d)/(transpose(d)*h(x_new(1),x_new(2))*d)
    
    elseif betaRule == 1 %Hestenes-Stiefel
        beta = hestenes_stiefel(x_0, x_new, g, d)
    
    elseif betaRule == 2 %Polak-Ribiere
        beta = polak_ribiere(x_0, x_new, g)
         
    elseif betaRule == 3 %Fletcher Reeves
        beta = fletcher_reeves(x_0, x_new, g)
   
    elseif betaRule == 4 %Powell
        beta = powell(x_0, x_new, g)
    end
     
    d = -g(x_new(1),x_new(2))+beta*d  
    x_0 = double(x_new)
    liste = [liste; f(x_0(1),x_0(2))]
    i=i+1
end

if (norm(g(x_0(1),x_0(2)),2) < tolerance)
    fprintf('Minimum succesfully obtained...\n\n');
end

x = 1:i
y = liste
end