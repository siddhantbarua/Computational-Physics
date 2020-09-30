%% Sorting function. Sort an array of numbers in increasing order.
%%
%%
%% Inputs->
%% arr : Input array to be sorted
%%
%% Outputs->
%% sorted_arr : Sorted array

function [sorted_arr] = Sort(arr)

        % Find length of array
        len = length(arr);
        
        % Sorting using Bubble sort
        for i=1:len
                for j=i+1:len
                        if arr(i) > arr(j)
                                % Swapping elements
                                temp = arr(i);
                                arr(i) = arr(j);
                                arr(j) = temp;
                        end
                end
        end
        sorted_arr = arr;
end






