%% Question 1.
%% Implementing all parts using functions defined in the files RandomNumGen.m, Sort.m


%% PART A
%%-----------------------------------------------------------------------------------------
disp("PART A");
disp("----------")
% Number of random numbers required
num = 5000;

% Define lower and upper bounds
lower = -1000;
upper = 1000;

random_nums = RandomNumGen(num, lower, upper);

% Define number of bins required for histogram
num_bins = 100;

% Plot histogram
hist(random_nums, nbins=num_bins);

% Calculate mean and variance
sum = 0;
sq_sum = 0;

for i = 1:1000
        sum += random_nums(i);
        sq_sum += random_nums(i)^2;
end

mean = sum / 1000;
var = (sq_sum / 1000) - mean^2;
std_dev = sqrt(var);

printf("Mean:%d\nVariance:%d\nStandard Deviation:%d\n\n\n", mean, var, std_dev);


%% PART B
%%------------------------------------------------------------------------------------------
disp("PART B");
disp("----------")
% Define length of array
len = 10;

% Initialise array with random numbers from 0 to 1000
arr = RandomNumGen(len, 0, 1000);

% Display initial array
disp("Initial array : ");
disp(arr);

% Sort array
arr = Sort(arr);

% Display sorted array
disp("Sorted array : ");
disp(arr);
printf("\n\n");


%% PART C
%%------------------------------------------------------------------------------------------
disp("PART C");
disp("----------")

% Find largest, smallest, mean, median and standard deviation.
arr_min = arr(1);
arr_max = arr(len);

arr_sum = 0;
arr_sq_sum = 0;

for i = 1:len
        arr_sum += arr(i);
        arr_sq_sum += arr(i)^2;
end

arr_mean = arr_sum / len;
arr_var = (arr_sq_sum / len) - arr_mean^2;
arr_stddev = sqrt(arr_var);

if mod(len, 2) != 0
        arr_median = arr((len + 1) / 2);
else
        arr_median = (arr(len / 2) + arr(len / 2 + 1)) / 2;
end

printf("Smallest element:%d\nLargest element:%d\nMean of array:%d\nMedian of array:%d\nStandard deviation of array:%d\n\n", arr_min, arr_max, arr_mean, arr_median, arr_stddev);
        
