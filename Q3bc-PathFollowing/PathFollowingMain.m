% Tut3a
close all  % close all opening figure windows
clear % Clear all variables in workspace

Tstep = 0.01; %Sampling period

% Start pose
x0 = -1;
x0_sim=[0,x0];
y0 = 1;
y0_sim=[0,y0];
theta0 = -pi/4;
theta0_sim=[0,theta0];

% Run the simulation
sim('DiffBotControl2014a',20);   

refPath(:,1) = robPose(:,1);
trackingError(:,1) = robPose(:,1);
for i=1:length(refPath(:,1))
    refPath(i,2)=atan(refPath(i,1)^2);
    trackingError(i,2) = refPath(i,2) - robPose(i,2);
end
% Plot results
figure()
plot(robPose(:,1),robPose(:,2));
hold on
plot(refPath(:,1),refPath(:,2));
legend('Real path','Reference path');
title('Robot trajectory')
xlabel('x (m)')
ylabel('y (m)')
grid on

figure()
plot(trackingError(:,1),trackingError(:,2));
title('Path tracking error')
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
