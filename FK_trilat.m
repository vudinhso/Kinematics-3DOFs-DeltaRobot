clc; clear all; close all; 
format compact; format shortG

n = 100;
#{
th1=linspace(0,pi/3,n);
th2=pi/6*linspace(1,1,n);
th3=pi/6*linspace(1,1,n);
#}
th1=pi/4*linspace(1,1,n);
th2=pi/6*linspace(1,1,n);
th3=1*linspace(0,pi/3,n);

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
    e1 = u(:,2)-u(:,1);
    e2 = u(:,3)-u(:,1);
    d1 = -d*(R-r)*(cos(th(j,2))-cos(th(j,1)));
    d2 = -d*(R-r)*(cos(th(j,3))-cos(th(j,1)));
    tmp1 = e1(1)*e2(3) - e2(1)*e1(3);
    tmp2 = e1(2)*e2(3) - e2(2)*e1(3);
    tmp3 = d1*e2(3) - d2*e1(3);
    A = -tmp1/tmp2;
    B = -tmp3/tmp2;
    C = -(e1(1)+e1(2)*A)/e1(3);
    D = -(e1(2)*B+d1)/e1(3);
    E = 1 + A^2 + C^2;
    F = 2*A*B + 2*C*D -2*(u(1,1) + u(2,1)*A + u(3,1)*C);
    G = B^2 + D^2 + norm(u(:,1))^2 - h^2 ...
        - 2*(u(2,1)*B + u(3,1)*D);
    
    xa = (-F+sqrt(F^2-4*E*G))/(2*E);
    xb = (-F-sqrt(F^2-4*E*G))/(2*E);
    ya = A*xa+B;
    yb = A*xb+B;
    za = C*xa+D;
    zb = C*xb+D;
    
    p1(j,:) = [xa, ya, za];
    p2(j,:) = [xb, yb, zb];
end
#{
figure
plot(1:n,th(:,1)); hold on; grid on
plot(1:n,th(:,2));
plot(1:n,th(:,3));
#}
figure
plot(1:n,p1(:,1)); hold on; grid on
plot(1:n,p1(:,2));
plot(1:n,p1(:,3));
legend('x','y','z','Location','northwest');

figure
plot(1:n,p2(:,1)); hold on; grid on
plot(1:n,p2(:,2));
plot(1:n,p2(:,3));
legend('x','y','z','Location','northwest');
