function plotAngle(theta,x,y,h)
%plotAngle Plots a line based on x,y with tetha angle from horizon
%   Uses rotation matrix to plot this line
Obj = [ 0 0; 0 h; 1 1];
%TtoO = [1 0 -; 0 1 -Ceny; 0 0 1];
TtoC = [1 0 x; 0 1 y; 0 0 1];
R = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
Obj = TtoC*R*Obj;
plot(Obj(1,:), Obj(2,:),'r.-')
end

