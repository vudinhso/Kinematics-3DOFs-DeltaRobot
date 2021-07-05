clc; clear all; close all; 
format compact; format shortG

#{
p=[0.08,0.04,.16]';
th = [2.4566       2.6812       2.9311];

p=[0.00,0.04,.16]';
th = [2.9058       2.7958       3.0207];
#}
n = 100;

th1=linspace(0,pi/3,n);
th2=pi/6*linspace(1,1,n);
th3=pi/6*linspace(1,1,n);
#{
th1=pi/2*linspace(1,1,n);
th2=pi/6*linspace(1,1,n);
th3=pi/3*linspace(1,1,n);
#}
th =[th1', th2', th3'];

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
end    
for j=1:n
    for i=1:3
        d0(:,i)=d*Qal(:,:,i)*[cos(th(j,i)),0,sin(th(j,i))]';
    end
    u = a-b+d0;
    vect = cross(u(:,2)-u(:,1), u(:,3)-u(:,1));
    e = vect/norm(vect);
    [c, r] = fcn_circum(u(:,1), u(:,2), u(:,3));
    med1 = norm(u(:,1)-c);
    dist1 = sqrt(h^2-med1^2);
    p1(j,:) = c + dist1*e;
    p2(j,:) = c + dist1*e;
end

figure
plot(1:n,th(:,1)); hold on; grid on
plot(1:n,th(:,2));
plot(1:n,th(:,3));

figure
plot(1:n,p1(:,1)); hold on; grid on
plot(1:n,p1(:,2));
plot(1:n,p1(:,3));
legend('x','y','z','Location','northwest');

#{
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
#}



