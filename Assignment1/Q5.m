%% Question 5
%% Quadratic Spline 

clear;
% Define Function to generate data points
F = @(x) sin(x);

% Define upper and lower bound of X range, a and b, and number of data points n
a = -20;
b = 20;
n = 20;
% Distance between consecutive data points
h = (b - a) / (n - 1);
X = linspace(a, b, n)';

% Add random noise
rand_vector = 2*rand(n, 1) - 1;
% Vector of values of function F with noise
Y = F(X); %+ 0.1*rand_vector;

% Parameters of the polynomials
A = zeros(n, 1);
B = zeros(n, 1);
C = zeros(n, 1);

% Ci = Yi
C = Y;

% Finding values of Ai's and Bi's 
for i = 2:n-1
        if i == 1
                B(1) = (Y(2) - Y(1)) / h;
        else
                B(i) = 2 * (Y(i) - Y(i-1)) / h - B(i-1);
        end
        A(i) = (Y(i+1) - Y(i)) / (h^2) - B(i) / h;
end

% Generate more points for interpolating polynomial
m = n*5 + 1;
T = linspace(a, b, m);
W = zeros(m, 1);

% Interpolate
for i = 1:m-1
        s = 1 + fix((T(i) - a) / h);

        W(i) = A(s)*(T(i) - X(s))^2 + B(s)*(T(i) - X(s)) + C(s);
end
W(m) = Y(n);

% Compare with Cubic Spline for comparison
Cubic_sp = spline(X, Y, T);

% Plot
subplot(1, 2, 1);
plot(X, Y, '*');
hold on;
plot(T, W, 'linewidth', 1.5);
title("Quadratic Spline");
grid on;
hold off;

subplot(1, 2, 2);
plot(X, Y, '*');
hold on;
plot(T, Cubic_sp, 'linewidth', 1.5);
title("Cubic Spline");
grid on;
hold off;
        




