% This is for Tut 4 in Kalman Filter
% 
clear all
close all
load measurement    % load the noisy measurement data
step=length(measurement);
dt = 0.5;       % time step;
A =[1 dt;0 1]; %  state model:  Xe(k+1)=Axe(k)+Bu(k);
B=[0.5*dt*dt;dt]; 
u=0.2;           % acceleration

H=[1 0];        % measurement model: Z(k+1)=Hx(k)+w(k);
P(:,:,1)=[10 0;0 1];     % initial error covariance matrix
x(:,1)=[9;0];  % initial estimation of the position and velocity
xa(:,1)=[10;0];    % actual state of the vehicle
xeq(:,1)=x(:,1); % using prediction only (no correction stage)

R=1;               % variance of the measurement noise.
z(1)=10;
z(2:step)=measurement(2:step);
for ind=2:step
    xeq(:,ind)=A*xeq(:,ind-1)+B*u; % this is for comparison: using system model only
    xe(:,ind)=A*x(:,ind-1)+B*u;  % state model estimate
    Pe(:,:,ind)=A*P(:,:,ind-1)*A'; % new covariance matrix  
    K(:,ind)=Pe(:,:,ind)*H'/(H*Pe(:,:,ind)*H'+R); % Kalman gain
    r(:,ind)=z(ind)-H*xe(:,ind); % Residual
    x(:,ind)=xe(:,ind)+K(:,ind)*r(:,ind); % correction
    P(:,:,ind)=(eye(2)-K(:,ind)*H)*Pe(:,:,ind);
    xa(:,ind)=A*xa(:,ind-1)+B*u; % Calculate the actual state
end
% plot the results
time=0:step-1;
figure(1)
plot(time,xa(1,:),'-o',time,x(1,:),'-+',time,z,'-*',time,xeq(1,:),'--')
legend('actual','kalman','measurement','prediction')
errk=xa(1,:)-x(1,:);
errm=xa(1,:)-z;
grid
figure(2)
plot(time,errk,'-o',time,errm,'-+')
legend('kalman error','measurement error')
grid
