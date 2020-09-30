%% Question 2(b) 

clear;
% Define constants
m = 10; % Mass of body
g = 9.8; % Acceleration due to gravity
v = 20; % Initial velocity
b = (0.2*m) / v; % Damping constant

% Define the function and derivative for distance 
F = @ (t) ( ( (m^2) * g + b * m * v) / b^2 ) * (1 - exp(-b * t / m)) - m * g * t / b;
F_t = @ (t) ( ( m * g + b * v) / b ) * exp(-b * t / m) - m * g / b; 

epsilon = 1.0e-12;
count = 1;
% Initial guess
t = 3;
t_new = t - F(t) / F_t(t);

while abs(t_new - t) > epsilon
        t = t_new;
        t_new = t - F(t) / F_t(t);
        if count > 100
                break;
        end
        count = count + 1;
end

% Display results
t_new
count
fprintf("Time taken by the ball to reach the ground is %d seconds\n", t_new);

