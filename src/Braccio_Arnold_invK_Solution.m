% This file is designed to solve the inverse kinematics of the Braccio and
% get the joint variables theta 1 to 5.
% x(1): theta 1, x(2): theta 2, x(3): theta 3, x(4): theta 4, x(5): theta 5

% X0 = [0 -pi/2 0 -pi/2 0];     % initial value for x(i) % Other initial
X0 = [0 -pi/2 0 0 0];     % initial value for x(i)
OPTIONS = optimoptions('fsolve','Algorithm','trust-region');
[x1,FVAL,EXITFLAG] = fsolve(@Braccio_invK, X0, OPTIONS)
LB = (pi/180)*[-90 -165 -90 -180 -90];
UB = (pi/180)*[90 -15 90 0 90];
[x2,EXITFLAG] = lsqnonlin(@Braccio_invK,X0,LB,UB,OPTIONS)
theta = x*180/pi;

function F = Braccio_invK(x)
d1 = 73.71;        % 77.71 + 2mm woodenbase thickness
a2 = 125.2;
a3 = 125.2;
d5 = 170;
px = 310;          % px range is (min [-150 150], max [-400 , 400])
py = 70;           % py range is (min [-150 150], max [-400 , 400])
pz = 10;           % pz range is [ 0, 480]   

% Three position components should satisfy the sphere equation X^2+Y^2+Z^2=r^2

% px = 0;          
% py = 0;          
% pz = 494.11;            
x5z0 = cosd(45);
y5z0 = cosd(90);
z5z0 = cosd(135);
% z5z0 = 0;
 F(1) = -d5*cos(x(1))*sin(x(2)+x(3)+x(4)) + cos(x(1))*(a3*cos(x(2)+x(3))+a2*cos(x(2))) - px;
 F(2) = -d5*sin(x(1))*sin(x(2)+x(3)+x(4)) + sin(x(1))*(a3*cos(x(2)+x(3))+a2*cos(x(2))) - py;
 F(3) = -d5*cos(x(2)+x(3)+x(4)) - a3*sin(x(2)+x(3)) - a2*sin(x(2)) + d1 - pz;
 F(4) = -cos(x(2)+x(3)+x(4)) - z5z0;
 F(5) =  x(5) + atan2(y5z0,x5z0);
end