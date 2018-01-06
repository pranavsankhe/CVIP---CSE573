% Problem 1: Image Alignment

%% 1. Load images (all 3 channels)
load('../data/blue.mat');
load('../data/green.mat');
load('../data/red.mat');

%% 2. Find best alignment
% Hint: Lookup the 'circshift' function
rgbResult = alignChannels(red, green, blue);
imshow(rgbResult);

%% 3. Save result to rgb_output.jpg (IN THE "results" folder)
