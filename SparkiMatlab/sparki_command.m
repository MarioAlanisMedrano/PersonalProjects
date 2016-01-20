function sparki_command(varargin)
%XXXX SETUP XXXX
fig = varargin{1}; %fig is the handle for the figure
charp = get(fig,'CurrentCharacter');
sparki = getappdata(fig,'Sparki');
Theta = getappdata(fig,'Theta');
Cen = getappdata(fig,'Center'); 
Cenx = Cen(1,1)'; Ceny = Cen(2,1)';


%XXXX START OF CODE XXXX
if charp == 'w'
    T = [1 0 -.25*sind(Theta); 0 1 .25*cosd(Theta); 0 0 1]; sparki = T*sparki; Cenp = T*Cen; %Translation matrix
    %updates Object coordinates and updates new image
    setappdata(fig,'Sparki',sparki); setappdata(fig,'Center',Cenp); Cenp%sets object, which is stored within fig data
    setappdata(fig,'Theta',Theta);Theta %set orientation of theta NOT NEEDED HERE
    h = findobj('type','line'); delete(h(1)); %takes care of replacing image without clearing fig data
    hold on; plot(sparki(1,:), sparki(2,:),'Color',[0 0.4470 0.7410]) %sets to original color and plots new image
elseif charp == 's'
    T = [1 0 .25*sind(Theta); 0 1 -.25*cosd(Theta); 0 0 1]; sparki = T*sparki; Cenp = T*Cen; %Translation matrix
    %updates Object coordinates and updates new image
    setappdata(fig,'Sparki',sparki); setappdata(fig,'Center',Cenp); Cenp%sets object, which is stored within fig data
    setappdata(fig,'Theta',Theta);Theta %set orientation of theta NOT NEEDED HERE
    h = findobj('type','line'); delete(h(1)); %takes care of replacing image without clearing fig data
    hold on; plot(sparki(1,:), sparki(2,:),'Color',[0 0.4470 0.7410]) %sets to original color and plots new image
elseif charp == 'a'
    theta = 5;Theta = mod(Theta + theta,360); %this is in degrees
    %matrix for rotation, takes to origin, rotates and moves back
    TtoO = [1 0 -Cenx; 0 1 -Ceny; 0 0 1]; TtoC = [1 0 Cenx; 0 1 Ceny; 0 0 1];
    R = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
    %updates Object coordinates and updates new image
    sparki = TtoC*R*TtoO*sparki; setappdata(fig,'Sparki',sparki);%sets object, which is stored within fig data
    setappdata(fig,'Theta',Theta);Theta
    h = findobj('type','line'); delete(h(1)); %takes care of replacing image without clearing fig data
    hold on; plot(sparki(1,:), sparki(2,:),'Color',[0 0.4470 0.7410]) %sets to original color and plots new image
elseif charp == 'd'
    theta = -5; Theta = mod(Theta + theta,360); %this is in degrees
    %matrix for rotation, takes to origin, rotates and moves back
    TtoO = [1 0 -Cenx; 0 1 -Ceny; 0 0 1]; TtoC = [1 0 Cenx; 0 1 Ceny; 0 0 1];
    R = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
    %updates Object coordinates and updates new image
    setappdata(fig,'Theta',Theta);Theta
    sparki = TtoC*R*TtoO*sparki; setappdata(fig,'Sparki',sparki);%sets object, which is stored within fig data
    h = findobj('type','line'); delete(h(1)); %takes care of replacing image without clearing fig data
    hold on; plot(sparki(1,:), sparki(2,:),'Color',[0 0.4470 0.7410]) %sets to original color and plots new image
elseif charp == 'x'
    close all
end
end

