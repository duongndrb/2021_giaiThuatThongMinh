% Tut3a
close all  % close all opening figure windows
clear % Clear all variables in workspace

Tstep = 0.01; %Sampling period

% Start pose
x0 = 1;
y0 = 2;
theta0 = 0;
x0_sim=[0,x0];
y0_sim=[0,y0];
theta0_sim=[0,theta0];

wp=[1,2;5,2;5.8,1.55;9.95,1;12.95 1];

% Run the simulation
sim('TricycleBotControl2014a',50);   


% Plot results
figure()
plot(robPose(:,1),robPose(:,2));
hold on
plot(wp(:,1),wp(:,2));
legend('Real path','Reference path');
title('Robot trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on


% Animate results
% NOTE: This requires the Robotics toolbox
% Download here: https://petercorke.com/download/27/rtb/1045/rtb10-4-mltbx.mltbx
start = [x0;y0;theta0];
goal = robPose(end,:);
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

