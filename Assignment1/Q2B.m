%% Question 2(b) 

% Define constants
% Mass of body
m = 10;
% Damping constant 
b = 1;
% Gravitational acceleration g
g = 9.8;
% Initial velocity
u = 5;

a = sqrt(g * m / b);

T = 2 * m * atan(u / a) / (a * b); 

printf("Mass m = %dkg\nb = %d\ng = %d\nInitial velocity u = %dm/s\n", m, b, g, u);

printf("Time required to reach the ground = %d\n", T);
