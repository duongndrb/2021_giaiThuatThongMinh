%% This program is used to simulate and animate the movement of a car.
close all  % close all opening figure windows
% start the simulation
disp('Running the simulation ...')
sim('diffcar.mdl',20)   % simulate the car for 20 seconds.
disp('you can open the diffcar.mdl in MATLAB to change the simulation parameters')
% get car's centre position from the simulink
x=carpos(:,1);
y=carpos(:,2);
xc=[];
yc=[];
th=carpos(:,3);
%assuming the car has a length of 1m and width of 0.4m
a=0.2;
b=0.5;
% calculate sin and cos theta
ct=cos(th);
st=sin(th);

% calculating the 4 corners of the car (assumed to be a rectangle)

x1=x-b*ct-a*st;
y1=y-b*st+a*ct;

x2=x-b*ct+a*st;
y2=y-b*st-a*ct;

x3=x+b*ct+a*st;
y3=y+b*st-a*ct;

x4=x+b*ct-a*st;
y4=y+b*st+a*ct;

% obtain the axis limits
xmin=min([x1;x2;x3;x4])-0.5;
xmax=max([x1;x2;x3;x4])+0.5;
ymin=min([y1;y2;y3;y4])-0.5;
ymax=max([y1;y2;y3;y4])+0.5;
%%  
axis([xmin,xmax,ymin,ymax]);
axis square
grid on

% doing the animation of the robot movement
% initial car position is shown in Green
% final car position is in RED
% the car's centre position is traced by BLUE
xp1=[x1(1);x2(1);x3(1);x1(1)];
yp1=[y1(1);y2(1);y3(1);y1(1)];
% xp1=[x1(1);x2(1);x3(1);x4(1);x1(1)];
% yp1=[y1(1);y2(1);y3(1);y4(1);y1(1)];

for i=1:length(x4)
    xp=[x1(i);x2(i);x3(i);x1(i)];
    yp=[y1(i);y2(i);y3(i);y1(i)];
%     xp=[x1(i);x2(i);x3(i);x4(i);x1(i)];
%     yp=[y1(i);y2(i);y3(i);y4(i);y1(i)];
    xc=[xc;x(i)];
    yc=[yc;y(i)];
    line(xp,yp,'Color','r');
%     if i~=1
%         line(xp1,yp1,'Color','g');
%     end
    line(xp1,yp1,'Color','g');
    hh=text(xmax/2,ymax/2,[num2str(timelog(i)) ' sec']);
    line(xc,yc,'Color','b');        % keep tracing the car's centre point
    pause(0.03);
    line(xp,yp,'Color','w')
    delete(hh)
end
line(xp,yp,'Color','k');