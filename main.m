%griewank([x1,x2,x5])
%x1^2/4000 + x2^2/4000 + x3^2/4000 + x4^2/4000 + x5^2/4000 - cos(x4/2)*cos((2^(1/2)*x2)/2)*cos((3^(1/2)*x3)/3)*cos((5^(1/2)*x5)/5)*cos(x1) + 1

% syms f1(x1,x2,x3)
% f1(x1,x2,x3) = 3/2*x1^2+2*x2^2+3/2*x3^2+x1*x3+2*x2*x3
% g1(x1,x2,x3) = gradient(f1, [x1, x2, x3])
% h1(x1,x2,x3) = hessian(f1, [x1, x2, x3])
close all;
clear all;
syms f3(x1,x2)
f3(x1,x2) = rosen([x1,x2])
g3(x1,x2) = gradient(f3, [x1,x2])
h3(x1,x2) = hessian(f3, [x1,x2])
x_aralik=2.048;

% syms f4(x1,x2)
% f4(x1,x2) = griewank([x1,x2])
% g4(x1,x2) = gradient(f4, [x1, x2])
% h4(x1,x2) = hessian(f4, [x1, x2])

syms f5(x1,x2)
f5([x1,x2]) = rastr([x1,x2])
g5([x1,x2]) = gradient(f5, [x1,x2])
h5([x1,x2]) = hessian(f5, [x1,x2])
% x_aralik=5.12;

f = f3
g = g3
h = h3

% renk haritasý olarak gösterilmesi
% figure;
% fcontour(f, 'Fill', 'On');
% xlim([(-1)*x_aralik x_aralik]) 
% ylim([(-1)*x_aralik x_aralik])
% title("2D-Rastrigin")
% colorbar
% hold on;
%x_0 = [1,1,2,-3,-1];
% x1=-1; x2=2; x3=0; x4 = 1;
x1=0.1; x2=0.1;
x_0 = [x1; x2];
epoch = 5;
% [x2, y2] = steepest_descent_v2(x_0, f, g, h, epoch)

[x1, y1] = steepest_descent(x_0, f, g, h, epoch)
[x2, y2] = newton(x_0, f, g, h, epoch)
[x3, y3] = modified_newton(x_0, f, g, h, epoch)
[x4, y4] = conjugate_gradient(x_0, f, g, h, epoch, 1)
[x5, y5] = conjugate_gradient(x_0, f, g, h, epoch, 2)
[x6, y6] = conjugate_gradient(x_0, f, g, h, epoch, 3)
[x7, y7] = conjugate_gradient(x_0, f, g, h, epoch, 4)

% figure;
plot(x1,y1, 'r'); hold on;
% plot(x2,y2, 'b'); hold on;
% plot(x3,y3, 'm'); hold on;
% plot(x4,y4, 'm'); hold on;
% plot(x5,y5, 'b'); hold on;
% plot(x6,y6, 'r'); hold on;
% plot(x7,y7, 'k'); hold on;


 xlabel("iteration")
 ylabel("f(x^*)")
 title("2D-Rastrigin")
 legend("Steepest Descent", "Newton", "Modified Newton", "Conjugate Gradient(Hestenes-Stiefel)","Conjugate Gradient(Polak-Ribiere)","Conjugate Gradient(Fletcher-Reeves)","Conjugate Gradient(Powell)")
% "Steepest Descent", "Newton", "Modified Newton", 
