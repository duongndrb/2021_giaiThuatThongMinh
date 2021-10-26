/* ------- Function matlab ------*/
function [xdot,ydot,thdot] = swedish_w(df1,df2,df3,th)
% in this function df1, df2 and df3 are the 3 wheels rotation velocity
%
l=2;
% the pure rolling constraints for 3 wheels.
pr=[sqrt(3)/2 -0.5 -l;-sqrt(3)/2 -0.5 -l;0 1 -l];

% the rotation matrix between robot frame and fixed frame is depending on
% the heading angle of the robot - th.
R=[cos(th) sin(th) 0;-sin(th) cos(th) 0;0 0 1];

% assuming wheel radius is 0.5m

r=0.5;

vr=[r*df1;r*df2;r*df3]; % wheels linear velocity

% the robot velocity in fixed frame is:
VF = R^-1*pr^-1*vr;
xdot=VF(1);
ydot=VF(2);
thdot=VF(3);
/*---------------------------------*/

Mô phỏng matlab
Nhập các giá trị của w vào các vận tốc các bánh xe rồi mô phỏng trên simulink