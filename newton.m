function [x,y] = newton(x_0, f, g, h, epoch)

x_1 = x_0;

liste = [];
noktalar = [double(x_1(1)) double(x_1(2))];
i = 0;
norm=1;
tolerance = 1e-8; % durma koþulu
while norm>tolerance & i<epoch
%     noktalar = [double(x_1(1)) double(x_1(2))]
%     plot(noktalar,'*-r');hold on;
    x_2 = x_1 - inv(double(h(x_1(1),x_1(2))))*double(g(x_1(1),x_1(2)))
    
    norm=abs(double(f(x_2(1),x_2(2))-f(x_1(1),x_1(2))));
    x_1 = double(x_2);
    i = i+1;
    liste = [liste; double(f(x_1(1),x_1(2)))];
end
if (norm< tolerance)
    fprintf('Minimum succesfully obtained...\n\n');
end

x = 1:i
y = liste

end