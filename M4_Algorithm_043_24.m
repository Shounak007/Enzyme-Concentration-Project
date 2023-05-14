function [v_max,k_m,v0s] = M4_Algorithm_043_24(data, concentrations, deltaTime)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description 
%  Find the v0s, v_max, and k_m for a given enzyme.
% Function Call
%  [v_max,k_m,v0s] = M4_Algorithm_043_24(data, concentrations)
% Input Arguments
%  data - the given enzyme data set
%  concentrations - the given concentrations
%  deltaTime - the time interval to denoise the data 
%
% Output Arguments
%  v0s - the estimated initial velocities
%  v_max - the Michealis-Menton v_max parameter
%  k_m - the Michealis-Menton k_m parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

% Table 4: Use our findV0 to find the V0s and compare with the given v_max and k_m michealis menton equation
% Table 5: Use our findMichealisMenton from given v0s to find v_max and k_m

%% ____________________
%% CALCULATIONS

denoisedX = []; % The new x-axis on the correct scale
denoisedData = []; % The denoised data
error = 0; % The amount of data points to accept
v0s = zeros(1,10); % The list of initial velocities
for y = 1:10 % Loop over each concentration
    [denoisedX, denoisedData] = denoiseData(data(:,y),deltaTime); % Denoise the data
    error = 32;
    %fprintf("Error: %d/%d\n", error, length(denoisedX));
    v0s(y) = findV0(denoisedX, denoisedData,error); % Find V0 for the data
end
[v,k] = findMichealisMenton(concentrations,v0s); % The Michealis-Menton v_max and k_m parameters
v_max = v;
k_m = k;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



