function [readings] = range_sensor(car_position)
% this function is used to return the sensor reading from the robot for PF
% to work properly.
% the user need to provide the car_position that contains 
% x position of the car.
%

% This is getting the car pose from the user input
r_x=car_position(1);

range_lim=100.;     %range limit
bearing_lim=2*pi;   %bearing limit
rrs=1e-4;           % distance measurement noise variance
rr=sqrt(rrs);       % STD
lmk=[3 1];          % landmark location
    
rbs=1e-4;
rb=sqrt(rbs);       % bearing noise


% the following are used to calculate the measurement - currupted by noise
dx=lmk(:,1)-r_x;
dy=lmk(:,2);
range=(dx.*dx+dy.*dy).^0.5+randn(size(dy))*rr;  % range measurement
bearing=atan2(dy,dx)+randn(size(dy))*rb;   % bearing measurement

% organise each reading into row vectors with 2 column - C1 is Range and C2
% is bearing
readings=[range,bearing];
readings(readings(:,1)>range_lim,:)=[];         % delete out of range readings
readings(abs(readings(:,2))>bearing_lim,:)=[];  

readings=sortrows(readings,2);       % order reading according to bearing angles
readings=readings(:,1);