%% Function for solving 2 ODEs using RK2

function [x, y_1 y_2] = RK2_2(N, x_0, x_N, y_10, y_20, f1, f2)

    h = (x_N - x_0) / (N - 1);

    y_1(1) = y_10;
    y_2(1) = y_20;

    x(1) = x_0;

    for n = 2:N
        
        k_11 = f1(x(n-1), y_1(n-1), y_2(n-1));
        k_21 = f2(x(n-1), y_1(n-1), y_2(n-1));
        
        k_12 = f1(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21);
        k_22 = f2(x(n-1) + h, y_1(n-1) + h*k_11, y_2(n-1) + h*k_21);
        
        y_1(n) = y_1(n-1) + h*(k_11 + k_12) / 2;
        y_2(n) = y_2(n-1) + h*(k_21 + k_22) / 2;
        
        x(n) = x(n-1) + h;
        
    end
end