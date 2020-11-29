%% Question 5

clear;
 
% Define constants
R = 0.04;
k = 0.05;
K = 0.8;
c = 3390;
rho = 1070;
a = K / (c * rho);
 
% Discretization
M = 101;
N = 500001;
h = R / (M - 1);
alpha = a * k / (h^2);
T = k * (N - 1);
x = 0:h:R;
t = 0:k:T;
 
% Temperature of boiling water
u0 = 100;
u = zeros(M, N);
 
% Initially at room temperature
u(1:M-1, 1) = 25;
u(M,1) = u0;
 
% For heating
for n = 1:N-1
    
    for m = 2:M-1;
        u(m, n+1) = (1 - 2*alpha) * u(m, n) + alpha * ((m-2)*u(m-1, n) + m*u(m+1, n))/ (m - 1);
    end
 
    u(1, n+1) = u(2, n+1);
    u(M, n+1) = u0;
    
    % When center reaches 70 degress
    if u(1, n+1) > 70
        break;
    end
end
 
c(1:n) = u(1, 1:n);
ht = n + 1;
 
% Plot heating 
subplot(1, 3, 1);
hold on
title("Time for Heating in minutes: ", k * (ht - 1) / 60);
 
for i = 4000:4000:ht
    plot(x, u(:,i), 'linewidth', 1.5);
end
 
hold off
 
% Plot center
subplot(1, 3, 3);
title("Center");
hold on;
plot(t(1:n), c(1:n));
 
% After taking out of water
u0 = 25;
u(M,1) = u0;
 
% Cooling
for n = ht:N-1
    
    for m = 2:M-1;
        u(m, n+1) = (1 - 2*alpha) * u(m, n) + alpha * ((m-2)*u(m-1, n) + m*u(m+1, n))/ (m - 1);
    end
    
    u(1, n+1) = u(2, n+1);
    u(M, n+1) = u0;
 
    % When center reaches 30 degrees
    if u(1, n+1) < 30
        break;
    end
end
 
ct = n + 1;
c(ht:ct) = u(1, ht:ct);
 
% Plot cooling
subplot(1, 3, 2);
hold on
title("Time for cooling in minutes: ", k * (ct - ht) / 60);
 
for i = (ht+7000):8000:ct
    plot(x, u(:, i), 'linewidth', 1.5)
end
 
hold off
 
% Plot center
subplot(1, 3, 3);
plot(t(ht:ct), c(ht:ct));
hold off;

disp("Time for heating in minutes: ");
disp(k * (ht - 1) / 60);
disp("Time for cooling in minutes: ");
disp(k * (ct - ht) / 60);
