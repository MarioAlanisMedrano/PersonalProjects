clc; close all; clear;

%test of math
% x = 0:.01:365;
% y1 = sind(x);
% y2 = cosd(x);
% plot(x,[y1;y2]); legend('sin','cos')

%right, up
%xdis = 8; ydis = 8;line([0 xdis],[0 0]); line([xdis xdis],[0 ydis])

%left, up
xdis = -8; ydis = 8;line([0 xdis],[0 0]); line([xdis xdis],[0 ydis])
hold on
h = sqrt(xdis^2 + ydis^2)

alpha = acosd(xdis/h) - 90
%angle to h
plotAngle(alpha,0,0)
%angle needed to rotate to go home
rotatesparki = alpha-180
%plotAngle(rotatesparki,xdis,ydis)

sparkidir = 0; %in degrees
sparkidir = sparkidir + rotatesparki
plotAngle(rotatesparki,xdis,ydis)