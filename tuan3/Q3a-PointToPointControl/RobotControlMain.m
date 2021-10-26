% Tut3a
close all  % close all opening figure windows
clear % Clear all variables in workspace

% Sampling time
Tstep = 0.01;

% Start pose
x0 = -1;
y0 = 1;
theta0 = pi/4;
x0_sim=[0,x0];
y0_sim=[0,y0];
theta0_sim=[0,theta0];

% End pose
target.time=0;
target.signals.values=[5 5 pi/2];

% Run the simulation
sim('DiffBot2014a');   

% Plot results
figure()
plot(robPose(:,1),robPose(:,2));
title('Robot trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on

% Animate results
% NOTE: This requires the Robotics toolbox
% Download here: https://petercorke.com/download/27/rtb/1045/rtb10-4-mltbx.mltbx
start = [x0;y0;theta0];
goal = target.signals.values;
figure()
plotv(robPose,'x0',start,'goal',goal,'mode',2);
title('Robot trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on

figure()
plotv(robPose,'x0',start,'goal',goal,'mode',1);
title('Robot trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on