clear; close all; clc; Center = [0;0;1];
plotSparki

lim = [-20 20];
set(gca,'units','pixels','XLim',lim,'YLim',lim)
AxisPixels=get(gca,'position');
set(gcf,'MenuBar','none') %turns off the menubar
%set(gcf,'WindowButtonDownFcn','My_ClickDown_388658')
%set(gcf,'WindowButtonUpFcn',@My_ClickUp_388658)
set(gcf,'keypressfcn',@sparki_command)
setappdata(gcf,'Sparki',sparki);
setappdata(gcf,'Theta',0) %initial orientation of sparki
setappdata(gcf,'Center',Center)