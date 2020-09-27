F = @(x) x.^5;

a = -20;
b = 20;
n = 20;

X = linspace(a, b, n)';

rand_vector = 2*rand(n, 1) - 1;

mult = (max(F(X)) - min(X))*0.1;
Y = F(X) + mult*rand_vector;

[T, Y_fit] = CurveFit(a, b, Y);

plot(T, Y_fit, 'linewidth', 1.0);

hold on;

plot(X, Y, '*');
grid on;

