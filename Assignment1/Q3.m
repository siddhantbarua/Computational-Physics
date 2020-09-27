%% Question 3
%% Intersection of torus, sphere and plane


% Inner radius of torus
a = 1;
% Outer radius of torus 
b = 3;
% Mean Radius R
R = (a + b) / 2;
% Radius of inner tube 
R1 = (b - a) / 2;

% Radius of sphere
r = 2;

% Parameters for plane (cx + dy + z = 0)
c = 4;
d = 1;

% Torus function
F1 = @ (x, y, z) (x^2 + y^2 + z^2 + R^2 - R1^2)^2 - 4*(R^2)*(x^2 + y^2); 
% Sphere 
F2 = @ (x, y, z) x^2 + y^2 + z^2 - r^2;
% Plane
F3 = @ (x, y, z) c*x + d*y + z;

% Derivatives
F1x = @ (x, y, z) 2*(x^2 + y^2 + z^2 + R^2 - R1^2)*2*x - 8*(R^2)*x;
F1y = @ (x, y, z) 2*(x^2 + y^2 + z^2 + R^2 - R1^2)*2*y - 8*(R^2)*y;
F1z = @ (x, y, z) 2*(x^2 + y^2 + z^2 + R^2 - R1^2)*2*z; 

F2x = @ (x, y, z) 2*x;
F2y = @ (x, y, z) 2*y;
F2z = @ (x, y, z) 2*z;

F3x = @ (x, y, z) c;
F3y = @ (x, y, z) d;
F3z = @ (x, y, z) 1;

% Define distance function
dist = @ (x1, x2) sqrt((x1 - x2)' * (x1 - x2));

epsilon = 1.0e-8;

% Initial Guess
X = [1; 2; 3];

J = [F1x(X(1), X(2), X(3)), F1y(X(1), X(2), X(3)), F1z(X(1), X(2), X(3)); 
        F2x(X(1), X(2), X(3)), F2y(X(1), X(2), X(3)), F2z(X(1), X(2), X(3)); 
        F3x(X(1), X(2), X(3)), F3y(X(1), X(2), X(3)), F3z(X(1), X(2), X(3))];

F = [F1(X(1), X(2), X(3)); F2(X(1), X(2), X(3)); F3(X(1), X(2), X(3))]; 

Xnew = X - J \ F;
count = 1;
d = dist(X, Xnew);

% Newton Rahpson Method iterations
while d >= epsilon
        X = Xnew;
        J = [F1x(X(1), X(2), X(3)), F1y(X(1), X(2), X(3)), F1z(X(1), X(2), X(3)); 
                F2x(X(1), X(2), X(3)), F2y(X(1), X(2), X(3)), F2z(X(1), X(2), X(3)); 
                F3x(X(1), X(2), X(3)), F3y(X(1), X(2), X(3)), F3z(X(1), X(2), X(3))];

        F = [F1(X(1), X(2), X(3)); F2(X(1), X(2), X(3)); F3(X(1), X(2), X(3))]; 

        Xnew = X - J \ F;

        count = count + 1;

        if (count > 1000)
                break;
        end

        d = dist(X, Xnew);
end


F = [F1(Xnew(1), Xnew(2), Xnew(3)); F2(Xnew(1), Xnew(2), Xnew(3)); F3(Xnew(1), Xnew(2), Xnew(3))]; 

% Display final values of X, and F, d and count.
Xnew
F
d
count
