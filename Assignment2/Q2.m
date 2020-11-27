%% Question 2
%% Uses RK2_6.m.

% Define parameters E0, B0, q, m
E0 = 0;
B0 = 10;
q = 0.01;
m = 0.5;

% Defining functions for the equations derived in part (A)
f1 = @(x, y_1, y_2, y_3, y_4, y_5, y_6) y_2;
f2 = @(x, y_1, y_2, y_3, y_4, y_5, y_6) (q*E0/m) - (q*B0/m)*y_4;
f3 = @(x, y_1, y_2, y_3, y_4, y_5, y_6) y_4;
f4 = @(x, y_1, y_2, y_3, y_4, y_5, y_6) (q*B0/m)*y_2;
f5 = @(x, y_1, y_2, y_3, y_4, y_5, y_6) y_6;
f6 = @(x, y_1, y_2, y_3, y_4, y_5, y_6) 0;

% Initial conditions and range
x_0 = 0; 
x_N = 100;

N = 1000;

y_10 = 0;
y_20 = 1;
y_30 = 0;
y_40 = 1;
y_50 = 0;
y_60 = 1;

[x, y_1, y_2, y_3, y_4, y_5, y_6] = RK2_6(N, x_0, x_N, y_10, y_20, y_30, y_40, y_50, y_60, f1, f2, f3, f4, f5, f6);


plot3(y_1, y_3, y_5);

