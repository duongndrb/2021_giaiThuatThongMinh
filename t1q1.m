%% tut3 Q1
% x=5+0.3*cos(0.1*pi*t), y=2+0.5*sin(0.2*pi*t)
% there are two land marks at (2,5) and (3,10)
% if the robot is taking measurements of the distance between the robot and
% the landmarks every 0.1 second.
% 1. write a program to calculate the trajectory of the robot and plot the
% robot trajectory in red stars
% 2. calculating the distance and angle bteween the robot and the landmarks
% during the motion of the robot
%% trajectory calculation
clear all 
close all
clc
x1=5;
y1=3; %LM1
x2=4.5;
y2=2.4; %LM2

% set figure locations
set(figure(1),'Position',[17 549 310 257])
set(figure(2),'Position',[339 551 343 253])
set(figure(3),'Position',[716 543 310 257])

t=0:0.1:10;
x=5+0.3*cos(0.1*pi*t);
y=2+0.5*sin(0.2*pi*t);
figure(1)
plot(x,y,'r*',x1,y1,'bs',x2,y2,'bs','MarkerSize',10,'MarkerFaceColor','r')
grid on
%% calculate the distance between the robot and landmarks
d1=sqrt((x-x1).*(x-x1)+(y-y1).*(y-y1));     % distance between the robot and Lm1
d2=sqrt((x-x2).*(x-x2)+(y-y2).*(y-y2));     % dist between robot and Lm2
dist=[d1;d2];
figure(2)
plot(dist')
legend('Dist to LM1','Dist to LM2')
grid

%% claculating the angle between the robot and landmarks
ang1=atan2((y1-y),(x1-x));
ang1=wrapTo2Pi(ang1);
ang2=atan2((y2-y),(x2-x));
ang2=wrapTo2Pi(ang2);
ang=[ang1;ang2];
figure(3)
plot(ang')
legend('Ang to LM1','Ang to LM2')
grid

%% animation
disp('Animating...')
jm=size(d1,2);
pause('on')
for j=2:jm      % plot every time step
    figure(1)
    plot(x(1:j),y(1:j),'r*',x1,y1,'bs',x2,y2,'bs','MarkerSize',10,'MarkerFaceColor','r')
    grid on
    
    figure(2)
    plot(dist(:,1:j)')
    legend('Dist to LM1','Dist to LM2')
    grid on
    figure(3)
    plot(ang(:,1:j)')
    legend('Ang to LM1','Ang to LM2')
    grid on
    pause(0.2)
end
disp('ALL DONE!!!')
    
