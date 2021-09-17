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
% LM1 position
Lm1x = 5;
Lm1y = 3;
% LM2 position
Lm2x = 4.5;
Lm2y = 2.4;

pi = 3.14
t = 0:0.1:10
x = 5 + 0.3 * cos(0.1 * pi * t)
y = 2 + 0.5 * sin(0.2 * pi * t)

plot(Lm1x,Lm1y,'r*',Lm2x,Lm2y,'bs',x,y,'*','MarkerEdgeColor','r','MarkerSize',8)
figure(1)
% turn on the grid
grid on

%% calculate the distance between the robot and landmarks
% distance between the robot and LM1
d1 = sqrt((x-Lm1x).*(x-Lm1x)+(y-Lm1y).*(y-Lm1y));
% distance between the robot and LM2
d2 = sqrt((x-Lm2x).*(x-Lm2x)+(y-Lm2y).*(y-Lm2y));

dist = [d1;d2];

%% calculate the angle between the robot and the landmark
% angle 1
ang1 = atan2((Lm1y-y),(Lm1x-x));
ang1 = wrapTo2Pi(ang1);
% angle 2
ang2 = atan2((Lm2y-y),(Lm2x-x));
ang2 = wrapTo2Pi(ang2);

% angle
ang = [ang1;ang2];

%% subplot the plot
figure(2)
subplot(2,1,1), plot(dist'),legend('Dist to Lm1','Dist to Lm2'),
subplot(2,1,2), plot(ang'),legend('Ang to Lm1','Ang to Lm2'),
grid

%% add animation
% set figure locations
set(figure(3),'Position',[17 549 310 257])
set(figure(4),'Position',[339 551 343 253])
set(figure(5),'Position',[716 543 310 257])

disp('Animating...')
jm=size(d1,2);
pause('on')
for j=2:jm      % plot every time step
    figure(3)
    plot(x(1:j),y(1:j),'r*',Lm1x,Lm1y,'bs',Lm2x,Lm2y,'bs','MarkerSize',10,'MarkerFaceColor','r')
    grid on
    
    figure(4)
    plot(dist(:,1:j)')
    legend('Dist to LM1','Dist to LM2')
    grid on
    figure(5)
    plot(ang(:,1:j)')
    legend('Ang to LM1','Ang to LM2')
    grid on
    pause(0.2)
end