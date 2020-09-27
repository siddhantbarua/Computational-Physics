%% Question 4.
%% Fit curve to data points using functions defined in GaussElim.m and CurveFit.m

% Define Function to generate data points
F = @(x) x.^9;

% Define upper and lower bound of X range, a and b, and number of data points n
a = -20;
b = 20;
n = 20;

X = linspace(a, b, n)';

% Add random noise
rand_vector = 2*rand(n, 1) - 1;

% Vector of values of function F with noise
Y = F(X) + 0.1*rand_vector;

% Fit curve to data points
[T, Y_fit] = CurveFit(a, b, Y);

% Plotting
plot(T, Y_fit, 'linewidth', 1.0);
hold on;
plot(X, Y, '*');
grid on;

