%% Question 3
%% Uses RK2_2.m

clear;

% Obtained values for a = {0.435574, 0.5679383, 0.653147, 0.7161665}
a = 0.653147;
 
% Reduced first order differential equations
f1 = @(x, y_1, y_2) y_2;
f2 = @(x, y_1, y_2) a * sqrt(1 + (y_2)^2);
 
% X coordinates of end points
n1 = 0;
n2 = 10;
 
% Y coordinates of end points
yn1 = 0;
yn2 = 0;
 
% Initial slope
alpha = (yn2 - yn1) / (n2 - n1);
 
epsilon = 0.00001;
 
% Number of points
N = 100;
 
% Solve using RK2
[x, y_1, y_2] = RK2_2(N, n1, n2, yn1, alpha, f1, f2);
 
count = 1;
 
while abs(y_1(N) - yn2) > epsilon
 
    alpha = alpha + (yn2 - y_1(N)) / (n2 - n1);
    [x, y_1, y_2] = RK2_2(N, n1, n2, yn1, alpha, f1, f2);
 
    count = count + 1;
 
    if count > 1000
        break
    end
end
 
% Calculate length of chain
len = 0;
h = (n2 - n1) / (N - 1);
 
for i = 2:N 
    len = len + sqrt(h^2 + (y_1(i) - y_1(i-1))^2);
end
 
% Plot chain
plot(x, y_1)
title("Length of wire is = ", len);
