%% Gaussian Elimination
%% Solves a system of linear equations using Gaussian Elimination method
%%
%%
%% Inputs ->
%% B : Augmented Matrix for system of linear equations 
%%
%% Outputs ->
%% X : Solutions for the linear system 

function [X] = GaussElim(B)
       
        % Get size of the augmented matrix
        [m, n] = size(B);

        % Gaussian Elimination procedure
        for i = 1:m-1
                if B(i, i) == 0
                        for j = i+1:m
                                if B(j, i) ~= 0 
                                        % Swap rows
                                        T = B(j, :);
                                        B(j, :) = B(i, :);
                                        B(i, :) = T;
                                        break;
                                end
                        end
                end
                for j = i+1:m
                        B(j, :) = B(j, :) - B(j, i) / B(i, i) * B(i, :);
                end
        end

        % Exception cases
        for i = 1:m
                if (B(i, i:m) == 0) & (B(i, m+1) ~= 0) % For octave use &&
                        disp("System inconsistent");
                        return;
                end
                if B(i, i:m+1) == 0
                        disp("The system has infinitely many solutions");
                        return;
                end
        end

        % Back substitute
        X = zeros(1, m);
        X(m) = B(m, m+1) / B(m, m);

        for i = m-1:-1:1
                sum = 0;
                for j = i+1:m
                        sum = sum + B(i, j)*X(j);
                end
                X(i) = 1/B(i, i)*(B(i, m+1) - sum);
        end
end


