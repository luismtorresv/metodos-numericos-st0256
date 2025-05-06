clc
clear all
close all

x=[3 3.7 4.4]';
y=[6 10 15]';
n=length(x);

A=[x.^2 x.^1 ones(n,1)]
b=y;
a=inv(A)*b

plot_range = -2:0.01:5;
pol = a(1)*plot_range.^2 + a(2)*plot_range.^1 + a(3)*plot_range.^0;

plot(x,y,'r*',plot_range,pol,'b-')
hold on
grid on