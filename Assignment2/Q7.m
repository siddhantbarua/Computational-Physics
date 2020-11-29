%% Question 7
 
clear;

% Define parameters
T = 0.1;
mu = 0.1;
L = 30;
 
% Discretize
h = 0.01;
k = 0.01;
M = (L / h) + 1;
 
% Mass of particle
mp = 0.5;
 
% Position of particle
pos = fix(3 * M / 4) + 1;
 
 
x = linspace(0, L, M);
v = sqrt(T / mu);
a = v * k / h;
 
% Set initial position profile (Gaussian) and initial velocity profile (to move right).
mid = fix(M / 2) + 1;
alpha = 600;
 
for m = 1:M
    u(m, 1) = 0.5 * exp(-alpha * ((x(m) - x(mid))^2) / L^2);
    u(m, 2) = (v * 2 * k * alpha /(L^2)) * (x(m) - x(mid)) * u(m, 1) + u(m, 1);
end
 
% Wave propagation
for i = 1:20
 
    t(i) = 5 * (i - 1);
    N(i) = (t(i) / k) + 1;
    
    u(1, :) = 0;
    u(m, :) = 0;
 
    for n = 2:N(i)
 
        for m = 2:pos - 1
            u(m, n+1) = (a^2) * (u(m+1, n) + u(m-1, n)) + 2 * (1 - a^2) * u(m, n) - u(m, n-1);
        end
 
        % Boundary condition for particle
        u(pos, n+1) = (T * (k^2) / (mp * h)) * (u(pos + 1, n) - 2 * u(pos, n) + u(pos - 1, n)) + 2 * u(pos, n) - u(pos, n-1);
        
        for m = pos + 1:M - 1
            u(m, n+1) = (a^2) * (u(m+1, n) + u(m-1, n)) + 2 * (1 - a^2) * u(m, n) - u(m, n-1);
        end
 
    end
    
    % Plot results
    subplot(4, 5, i);
    plot(x, u(:, N(i)), 'r', 'linewidth', 1.5);
    axis([0, L, -1, 1])
 
end
