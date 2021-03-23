clc; clear all; close all; 
format compact; 
#format shortG

#Model
R = .15;
r = .1;
alpha = [0, 2/3*pi, -2/3*pi];
d = .1;
h = .15;

#p=[0.08,0.04,.16]';
p=[0.00,0.04,.16]';

for i=1:3
    #Rotation matrix Qal, attachment position a and b
    Qal(:,:,i) = [...
    cos(alpha(i)) ,  -sin(alpha(i)), 0; 
    sin(alpha(i)) ,   cos(alpha(i)), 0; 
    0,0,1];
    a(:,i) =  Qal(:,:,i)*[R,0,0]';
    b(:,i) =  Qal(:,:,i)*[r,0,0]';
end
for i=1:3
    #Length l
    l =  norm(-a(:,i) + b(:,i) + p);
    #Coefficient u, v, w
    tmp = -2*d*(Qal(:,:,i)'*p + [r-R,0,0]');
    u = tmp(1);
    v = tmp(3);
    w = l^2 + d^2 - h^2;
    tha(i) = 2*atan2(-v+sqrt(u^2+v^2-w^2), w-u);
    thb(i) = 2*atan2(-v-sqrt(u^2+v^2-w^2), w-u);
end

figure
t = linspace(0,2*pi,40);
base_h = 0*t;
base_m = p(3)*ones(1, numel(t));
plot3 (R.*sin(t), R.*cos(t), base_h, 'LineWidth',2); hold on
plot3 (p(1)+r.*sin(t), p(2)+r.*cos(t), base_m, 'LineWidth',2); 
set (gca (), "zdir", "reverse")
set (gca (), "xdir", "reverse")
set (gca (), "ydir", "reverse")

for i = 1:3
    dpos(:,i) = a(:,i) + d*Qal(:,:,i)*[cos(tha(i)), 0, sin(tha(i))]';
    bpos(:,i) = p + b(:,i);
end

for i = 1:3
    plot3(  [a(1,i), dpos(1,i)], ...
            [a(2,i), dpos(2,i)], ...
            [a(3,i), dpos(3,i)], 'LineWidth',3);
    plot3(  [bpos(1,i), dpos(1,i)], ...
            [bpos(2,i), dpos(2,i)], ...
            [bpos(3,i), dpos(3,i)], 'LineWidth',3);
end
plot3(p(1), p(2), p(3), 'Marker','.' ,'MarkerSize', 3)
tha

