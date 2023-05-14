function[denoise_x,denoise_y] = denoiseData(input_data,delta_time)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Program Description 
%  Denoise the given data, averaging the data over the given delta_time
% Function Call 
%  [denoise_data] = denoiseData(input_data,delta_time)
% Input Arguments
%  input_data - the data to denoise
%  delta_time - the interval to average
% Output Arguments
%  denoise_data - the denoised data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data_length = length(input_data) - 1; % The length of the given data

%Removing empty spaces
for counter = 1:data_length
    if isnan(input_data(counter))
        input_data = input_data(1:(counter - 1));
        break
    end
end
 
new_length = length(input_data); % The length of the data without empty spaces
selection = []; % The except of the data to denoise
denoise_x = (1:new_length) .* 5; % The new x-axis on the correct scale
for counter_1 = 1:new_length
    selection = input_data((counter_1 * delta_time):(min(new_length - 1, counter_1 * delta_time + delta_time)));
    denoise_y(counter_1) = mean(selection,1);
end
 