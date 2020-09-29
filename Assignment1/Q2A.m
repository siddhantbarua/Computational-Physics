%% Question 2, Part A
%% Find eigenvalues of a particle in a finitely deep potential well, using Newton Rhapson Method

% Define parameters. L = Length of well, V = Potential V0
L = 10;
V = 10;

% Plot Functions initially, to see intersection points
%------------------------------------------------------------------------------------------
% Define functions
% LHS 
F1 = @ (x) sqrt((1-x) ./ x);
% RHS for symmetric
F2 = @ (x) tan(0.4*L*sqrt(V*x));
% RHS for asymmetric
F3 = @ (x) -cot(0.4*L*sqrt(V*x));

% Range of X values
X = linspace(0, 1, 100)';

% Calculate Y values
Y1 = F1(X); 
Y2 = F2(X);
Y3 = F3(X);

% Plot the functions
% Plot with symmetric equation
subplot(1, 2, 1);
plot(X, Y1, 'linewidth', 1.5);
title("Symmetric Plot");
hold on;
plot(X, Y2, 'linewidth', 1.5);
hold off;

% Plot with asymmetric equation
subplot(1, 2, 2);
plot(X, Y1, 'linewidth', 1.5);
title("Asymmetric Plot");
hold on;
plot(X, Y3, 'linewidth', 1.5);
hold off;


% Find Energy Eigenvalues
% ----------------------------------------------------------------------------------------
% Define new functions for Newton Rhapson
Fsym = @ (x) F1(x) - F2(x);
Fasym = @ (x) F1(x) - F3(x);

% Derivatives
Fsym_x = @ (x) ((-1./x) - ((1-x)./x)) ./ (2*sqrt((1-x) ./ x)) - (L*V*(sec(2*L*sqrt(V*x) / 5)).^2) ./ (5*sqrt(V*x));
Fasym_x = @ (x) ((-1./x) - ((1-x)./x)) ./ (2*sqrt((1-x) ./ x)) - (L*V*(csc(2*L*sqrt(V*x) / 5)).^2) ./ (5*sqrt(V*x));

% For symmetric case
% Initial guesses for 3 roots
X = [0.1; 0.25; 0.5];
epsilon = 1.0e-8;
X_new = zeros(3, 1);

for i=1:3
        X_new(i) = X(i) - Fsym(X(i)) / Fsym_x(X(i));
        count = 0;
        while abs(X_new(i) - X(i)) > epsilon
                X(i) = X_new(i);
                X_new(i) = X(i) - Fsym(X(i)) / Fsym_x(X(i));
        end
end

E = V*X_new

% For asymmetric case
% Initial guesses for 3 roots
X1 = [0.21; 0.4; 0.6];% 0.5];
epsilon = 1.0e-8;
X1_new = zeros(3, 1);

for i=1:3
        X1_new(i) = X1(i) - Fasym(X1(i)) / Fasym_x(X1(i));
        count = 0;
        while abs(X1_new(i) - X1(i)) > epsilon
                X1(i) = X1_new(i);
                X1_new(i) = X1(i) - Fasym(X1(i)) / Fasym_x(X1(i));
        end
end

E1 = V*X1_new


