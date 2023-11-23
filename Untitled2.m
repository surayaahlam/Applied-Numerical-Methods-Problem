clc;
clear all;
close all;

Wb = 1.663*10^6
Ws = 195000
Ts = 1.125*10^6
Tb = 5.30*10^6
%theta = 0:0.001:1;

momentequ = @(theta) (4*Tb) + (24*Ws) + (38*Ts*sin(theta)) - (24*Ts*cos(theta)) - (4*Wb);
dmomentequ = @(theta) (38*Ts*cos(theta)) + (24*Ts*sin(theta))

theta = -5:0.00001:5;
y = feval(momentequ,theta);

figure(3)
plot(theta,y);
xlabel('theta');
ylabel('f(theta)');
hold on;
plot(4.095010, 0.080550, 'o');
grid on;
hold off;

r = newton(momentequ,dmomentequ,3,0.001,10)
