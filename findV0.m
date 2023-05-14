function [v0] = findV0(xaxis, data, error)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description 
%  Find the v0 of a given dataset.
% Function Call
%  [v0] = findV0(data, error)
% Input Arguments
%  xaxis - the x-axis of the data
%  data - the data to find the v0 of
%  error - the amount a slope has to differ from the initial line
% Output Arguments
%  v0 - the initial velocity - the slope of the linear section of the line
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
initialSlope = (data(1) - 0) / xaxis(1); % The initial slope of the data
slopes = []; % The list of slopes of the data
lastX = 1; % The index where the data stops being linear
for x = 2:length(data)
    slopes(x) = (data(x) - data(x - 1)) / (xaxis(x) - xaxis(x - 1));
end
v0 = mean(slopes(10:error));
% v0 = (data(lastX) - data(1)) / (xaxis(lastX) + 1); % The initial velocity

