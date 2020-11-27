%% Question 3
%% Uses RK2_2.m

a = 0.716164;

f1 = @(x, y_1, y_2) y_2;
f2 = @(x, y_1, y_2) a * sqrt(1 + (y_2)^2);

n1 = 0;
n2 = 10;

yn1 = 0;
yn2 = 0;

alpha = (yn2 - yn1) / (n2 - n1);

epsilon = 0.00001;

N = 100;

[x, y_1, y_2] = RK2_2(N, n1, n2, yn1, alpha, f1, f2);

count = 1;

while abs(y_1(N) - yn2) > epsilon

    alpha = alpha + (yn2 - y_1(N))/(n2 - n1);
    [x, y_1, y_2] = RK2_2(N, n1, n2, yn1, alpha, f1, f2);

    count = count + 1;

    if count > 1000
        break
    end
end


len = 0;
h = (n2 - n1) / (N - 1);

for i = 2:N 
    len = len + sqrt(h^2 + (y_1(i) - y_1(i-1))^2);
end

len

plot(x, y_1)