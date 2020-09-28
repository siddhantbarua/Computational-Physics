%% Question 1.
%% Implementing all parts using functions defined in the files RandomNumGen.m, Sort.m


%% PART A
%%-----------------------------------------------------------------------------------------
disp("PART A");
disp("----------")
% Number of random numbers required
num = 1000;

% Define lower and upper bounds
lower = -1000;
upper = 1000;

random_nums = RandomNumGen(num, lower, upper);

% Define number of bins required for histogram
num_bins = 100;

% Plot histogram
hist(random_nums, nbins=num_bins);

% Calculate mean and variance
printf("Mean:%d\nVariance:%d\nStandard Deviation:%d\n\n\n", mean(random_nums), var(random_nums), std(random_nums));


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
arr_min = min(arr);
arr_max = max(arr);
arr_mean = mean(arr);
arr_median = median(arr);
arr_stddev = std(arr);

printf("Smallest element:%d\nLargest element:%d\nMean of array:%d\nMedian of array:%d\nStandard deviation of array:%d\n\n", arr_min, arr_max, arr_mean, arr_median, arr_stddev);
        
