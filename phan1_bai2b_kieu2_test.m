close all  % close all opening figure windows
clear % Clear all variables in workspace
clc % Clear command window

Tstep = 0.01; % Sampling Period

% Start Pose
x0 = 1;
y0 = 2;
theta0 = 0;
x0_sim = [0, x0];
y0_sim = [0, y0];
theta0_sim = [0, theta0];

% Run the simulation
sim('phan1_bai2b_kieu2.slx');   

% Animate results
% NOTE: This requires the Robotics toolbox
% Download here: https://petercorke.com/download/27/rtb/1045/rtb10-4-mltbx.mltbx
start = [x0; y0; theta0];
goal = ans.rbPose(end, :);
gmax = max(ans.rbPose);
gmin = min(ans.rbPose);

figure()
plot(ans.rbPose(:,1),ans.rbPose(:,2));
title('Robot trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on

figure()
plotv(ans.rbPose,'x0', start, 'goal', goal, 'gmax', gmax, 'gmin', gmin, 'mode', 2);
title('Position tricycle robot type 2 in 30 seconds')
xlabel('x (m)')
ylabel('y (m)')
grid on

figure()
plotv(ans.rbPose,'x0', start, 'gmax', gmax, 'gmin', gmin, 'mode', 1);
title('Robot Trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on
