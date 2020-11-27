%% Question 5

% Define constants
R = 0.04;
k = 0.05;
K = 0.8;
c = 3390;
rho = 1070;

a = K / (c * rho);
M = 101;
N = 50001;
h = R / (M - 1);
 
alpha = a * k / (h^2);
u0 = 100;
x = 0:h:R;
u = zeros(M, N);
u(1:M-1, 1) = 25;
u(M,1) = u0;

for n = 1:N-1
    
    for m = 2:M-1;
        u(m, n+1) = (1 - 2*alpha) * u(m, n) + alpha * ((m-2)*u(m-1, n) + m*u(m+1, n))/ (m - 1);
    end
    
    u(1, n+1) = u(2, n+1);
    u(M, n+1) = u0;

    if u(1, n+1) > 70
        break;
    end
    
end

n+1
temp = n+1;
u0 = 25;
u(M,1) = u0;


for n = temp:N-1
    
    for m = 2:M-1;
        u(m, n+1) = (1 - 2*alpha) * u(m, n) + alpha * ((m-2)*u(m-1, n) + m*u(m+1, n))/ (m - 1);
    end
    
    u(1, n+1) = u(2, n+1);
    u(M, n+1) = u0;

    if u(1, n+1) < 30
        break;
    end
    
end

n+1-temp

hold on

for i = 4001:4000:N
    plot(x, u(:,i), 'linewidth', 1.5)
end

hold off
 
T = k * (N - 1) / 60;
