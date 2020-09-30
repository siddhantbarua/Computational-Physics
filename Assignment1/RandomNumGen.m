%% Random Number generator function 
%% 
%%
%% Input parameters-> 
%% n: Number of random numbers required; 
%% lower : Lower bound of range of random numbers needed; 
%% upper : Upper bound of random numbers needed
%%
%% Output->
%% rand_nums : Array of random numbers generated

function [rand_nums] = RandomNumGen(n, lower, upper)
        
        rand_nums = zeros(1, n);
        % Seed or starting value for the random numbers
        seed = 77;

        % Set parameters for the random number generator
        a = 37;
        c = 311;
        m = upper - lower;

        for i=1:n
                % First number set to seed
                if i == 1
                        rand_nums(i) = seed;
                else
                        rand_nums(i) = mod((a*rand_nums(i-1) + c), m) + lower;
                end
        end

end 
