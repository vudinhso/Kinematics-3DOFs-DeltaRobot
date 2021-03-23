clc; clear all; close all; 
format compact; format shortG

p=[0.08,0.04,.16]';
th = [2.4566       2.6812       2.9311];

p=[0.00,0.04,.16]';
th = [2.9058       2.7958       3.0207];

#model
R = .15;
r = .1;
alpha = [0, 2/3*pi, -2/3*pi];
d = .1;
h = .15;

for i=1:3
    Qal(:,:,i) = [...
    cos(alpha(i)) ,  -sin(alpha(i)), 0; 
    sin(alpha(i)) ,   cos(alpha(i)), 0; 
    0,0,1];
    a(:,i) =  Qal(:,:,i)*[R,0,0]';
    b(:,i) =  Qal(:,:,i)*[r,0,0]';
    d0(:,i)=d*Qal(:,:,i)*[cos(th(i)),0,sin(th(i))]';
end

u = a-b+d0;

e0 = [  -d*(R-r)*(cos(th(2)) - cos(th(1))), ...
        -d*(R-r)*(cos(th(3)) - cos(th(1)))];
plan1 = u(:,2)-u(:,1);
plan2 = u(:,3)-u(:,1);

plan1 = [plan1(1:2); , e0(1)];
plan2 = [plan2(1:2); , e0(2)];
plan3 = cross(plan1, plan2);
p0 = [plan3(1)/plan3(3), plan3(2)/plan3(3), 0]';

vect = cross(u(:,2)-u(:,1), u(:,3)-u(:,1));
n = vect/norm(vect);

Q = 1;
R = 2*dot(p0-u(:,1),n);
S = norm(p0 - u(:,1))^2 - h^2;

dist_t1 = (-R+sqrt(R^2-4*Q*S))/(2*Q);
dist_t2 = (-R-sqrt(R^2-4*Q*S))/(2*Q);

p_t1 = p0 + dist_t1*n
p_t2 = p0 + dist_t2*n

[c, r] = fcn_circum(u(:,1), u(:,2), u(:,3));

med1 = norm(u(:,1)-c);
dist1 = sqrt(h^2-med1^2);
p1 = c + dist1*n
p2 = c - dist1*n

figure
plot3(  [u(1,1), u(1,2), u(1,3), u(1,1)], ...
        [u(2,1), u(2,2), u(2,3), u(2,1)], ...
        [u(3,1), u(3,2), u(3,3), u(3,1)], 'LineWidth',3); hold on

plot3(  c(1), c(2), c(3), 'Marker','.', 'MarkerSize',6)
set (gca (), "zdir", "reverse")
set (gca (), "xdir", "reverse")
set (gca (), "ydir", "reverse")
plot3(  p(1), p(2), p(3), 'Marker','.', 'MarkerSize',6)
plot3(  [c(1), p1(1)], ...
        [c(2), p1(2)], ...
        [c(3), p1(3)])
axis equal, grid on

