%% Curve Fitting function.
%% Fits a curve to data points using Legendre Polynomials.
%% Solves the equations using Gaussian Elimination
%%
%%
%% Inputs ->
%% a : Lower limit
%% b : Upper Limit
%% Y : Array of the data points
%%
%% Outputs ->
%% T : Array of X values for fitting function
%% Y_fit : Values of fitting function 

% Curve fitting function
function [T, Y_fit] = CurveFit(a, b, Y)

        % Define Legendre polynomials
        P0 = @ (x) 1;
        P1 = @ (x) x;
        P2 = @ (x) (3*x^2 - 1) / 2;
        P3 = @ (x) (5*x^3 - 3*x) / 2;
        P4 = @ (x) (35*x^4 - 30*x^2 + 3) / 8;
        P5 = @ (x) (63*x^5 - 70*x^3 + 15*x) / 8;
       
        % Number of numbers in input
        n = length(Y);
        X = linspace(a, b, n)';
        A = zeros(6, n);
        
        % Construct matrix A
        for j = 1:n
                A(:, j) = [P0(X(j)); P1(X(j)); P2(X(j)); P3(X(j)); P4(X(j)); P5(X(j))];
        end

        % Calculate coefficients alpha using Gaussian Elimination. Solve C*alpha = D
        C = (A*A');
        D = A*Y;
        C = [C, D];
        alpha = GaussElim(C);
        
        % Generate Y_fit points
        T = linspace(a, b, 500)';
        Y_fit = zeros(500, 1);
        
        % Calculate Fitting function
        for j = 1:500
                Y_fit(j) = alpha(1)*P0(T(j)) + alpha(2)*P1(T(j)) + alpha(3)*P2(T(j)) + alpha(4)*P3(T(j))+ alpha(5)*P4(T(j)) + alpha(6)*P5(T(j));
        end
end

