%% Function for solving 6 ODEs using RK2. (Implementation of Q2(b))
%% 
%%
%% Input parameters-> 
%% N: Number of random data points
%% x_0 : Lower bound of x
%% x_N : Upper bound of x
%% y_10, y_20...y_60 : Initial conditions for y_1, y_2...y_6
%% f1, f2...f6 : Functions
%%
%% Output->
%% x : Array of x values
%% y_1, y_2...y_6 : Arrays of values of y_1, y_2...y_6
 
function [x, y_1, y_2, y_3, y_4, y_5, y_6] = RK2_6(N, x_0, x_N, y_10, y_20, y_30, y_40, y_50, y_60, f1, f2, f3, f4, f5, f6)
 
    % Interval width
    h = (x_N - x_0) / (N - 1);
 
    % Initial conditions
    y_1(1) = y_10;
    y_2(1) = y_20;
    y_3(1) = y_30;
    y_4(1) = y_40;
    y_5(1) = y_50;
    y_6(1) = y_60;
 
    x(1) = x_0;
 
    % Iteration for RK2
    for n = 2:N
        
        k_11 = f1(x(n-1), y_1(n-1), y_2(n-1), y_3(n-1), y_4(n-1), y_5(n-1), y_6(n-1));
        k_21 = f2(x(n-1), y_1(n-1), y_2(n-1), y_3(n-1), y_4(n-1), y_5(n-1), y_6(n-1));
        k_31 = f3(x(n-1), y_1(n-1), y_2(n-1), y_3(n-1), y_4(n-1), y_5(n-1), y_6(n-1));
        k_41 = f4(x(n-1), y_1(n-1), y_2(n-1), y_3(n-1), y_4(n-1), y_5(n-1), y_6(n-1));
        k_51 = f5(x(n-1), y_1(n-1), y_2(n-1), y_3(n-1), y_4(n-1), y_5(n-1), y_6(n-1));
        k_61 = f6(x(n-1), y_1(n-1), y_2(n-1), y_3(n-1), y_4(n-1), y_5(n-1), y_6(n-1));
 
        k_12 = f1(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21, y_3(n-1) + h*k_31, y_4(n-1) + h*k_41, y_5(n-1) + h*k_51, y_6(n-1) + h*k_61);
        k_22 = f2(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21, y_3(n-1) + h*k_31, y_4(n-1) + h*k_41, y_5(n-1) + h*k_51, y_6(n-1) + h*k_61);
        k_32 = f3(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21, y_3(n-1) + h*k_31, y_4(n-1) + h*k_41, y_5(n-1) + h*k_51, y_6(n-1) + h*k_61);
        k_42 = f4(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21, y_3(n-1) + h*k_31, y_4(n-1) + h*k_41, y_5(n-1) + h*k_51, y_6(n-1) + h*k_61);
        k_52 = f5(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21, y_3(n-1) + h*k_31, y_4(n-1) + h*k_41, y_5(n-1) + h*k_51, y_6(n-1) + h*k_61);
        k_62 = f6(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21, y_3(n-1) + h*k_31, y_4(n-1) + h*k_41, y_5(n-1) + h*k_51, y_6(n-1) + h*k_61);
 
        y_1(n) = y_1(n-1) + h*(k_11 + k_12)/2;
        y_2(n) = y_2(n-1) + h*(k_21 + k_22)/2;
        y_3(n) = y_3(n-1) + h*(k_31 + k_32)/2;
        y_4(n) = y_4(n-1) + h*(k_41 + k_42)/2;
        y_5(n) = y_5(n-1) + h*(k_51 + k_52)/2;
        y_6(n) = y_6(n-1) + h*(k_61 + k_62)/2;
 
        x(n) = x(n-1) + h;
        
    end

end
