%% Question 6
 
clear;

% Define parameters
T = 0.1;
mu = 0.1;
L = 30;
 
% Discretize
h = 0.01;
k = 0.01;
M = (L / h) + 1;
 
x = linspace(0, L, M);
v = sqrt(T / mu);
a = v * k / h;
 
% Set initial position profile (Gaussian) and initial velocity profile (0).
mid = fix(M / 2) + 1;
alpha = 600;
 
for m = 1:M
    u(m, 1) = 0.5 * exp(-alpha * ((x(m) - x(mid))^2) / L^2);
    u(m, 2) = u(m, 1);
end
 
% Wave propagation
for i = 1:20
 
    t(i) = 5 * (i - 1);
    N(i) = (t(i) / k) + 1;
 
    for n = 2:N(i)
        
        for m = 2:M-1
            u(m, n+1) = (a^2) * (u(m+1, n) + u(m-1, n)) + 2 * (1 - a^2) * u(m, n) - u(m, n-1);
        end
        
        % Neumann boundary conditions for both free ends.
        u(1, n+1) = (a^2) * 2* u(2, n) + 2 * (1 - a^2) * u(1, n) - u(1, n-1);
        u(M, n+1) = (a^2) * 2* u(M-1, n) + 2 * (1 - a^2) * u(M, n) - u(M, n-1);
        
    end
 
    % Plot results
    subplot(4, 5, i);
    plot(x, u(:, N(i)), 'r', 'linewidth', 1.5);
    axis([0, L, -1, 1])
 
end
