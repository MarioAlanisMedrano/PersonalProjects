clc;close all; clear;
xdis = randi([-10 0],1,1);
ydis = randi([0 10],1,1);
line([0 xdis],[0 0]); line([xdis xdis],[0 ydis]);
hold on
%cleaned up code
h = norm([xdis ydis])
alpha = acosd(xdis/h)-90
%calculating the angle that sparki needs to rotate
rotatesparki = 180-90-abs(alpha)
sparkidir = 0
newdir = sparkidir + rotatesparki
plotAngle(newdir,xdis,ydis,h)