function M3_MM_PGOX50_043_24()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description 
%  Compare our estimation algorithm with the given example data for
%  PGOX50.
% Function Call 
%  M3_MM_PGOX50_043_24()
% Input Arguments
%  
% Output Arguments
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = readmatrix('Data_PGOX50_enzyme.csv'); % The given PGOX50 data

concentrations = data(5,2:end); % The given concentrations
enzymeData = data(8:end,2:end); % The given exprimental enzyme data


% Table 3

givenV0s = [0.025,0.049,0.099,0.176,0.329,0.563,0.874,1.192,1.361,1.673]; % The list of v0s given by M3
givenV_max = 1.806; % The v_max given by M3
givenK_m = 269.74; % The k_m given by M3
givenMichealisMenton = (givenV_max .* concentrations) ./ (givenK_m + concentrations); % The Michealis-Menton model from the given parameters

sse = sum((givenMichealisMenton - givenV0s) .^ 2); % The sse between the michealis menton model and v0s provided in M3

figure(1)
for x = 1:10
    plot(1:length(enzymeData),enzymeData(:,x),'b-');
    hold on
    plot([1,length(enzymeData)],[1,givenV0s(x) * (length(enzymeData))]);
end
title("Experimental Data w/ Given Initial Velocities");
xlabel("Time [seconds]");
ylabel("Concentration [uM]");
grid on

fprintf("The sum-squared error between the given v0s and the estimated Michealis Menton is %.3f.\n", sse);

% Table 4

v0s = []; % Our estimated v0s
denoisedData = []; % Our denoised data
error = 0.5; % The error allowed for finding the v0
delta_time = 10; % The delta time for averaging values to denoise
for x = 1:10
    denoisedData = denoiseData(enzymeData(:,x),delta_time);
    v0s(x) = findV0(denoisedData,error,delta_time);
end

figure(3)
[v_max, k_m] = findMichealisMenton(concentrations,v0s); % v_max and k_m estimated by our algorithm
plotMichealisMenton(v0s,concentrations,v_max,k_m);

% Table 5a
sseGivenEstimated = sum((givenMichealisMenton - v0s) .^ 2); % The sse between the given michealis menton and our estimated v0s
fprintf("The sum squared error between the given michealis menton and the estimated v0s is %.3f.\n", sseGivenEstimated);

% Table 5b
[estimatedV_max, estimatedK_m] = findMichealisMenton(concentrations,givenV0s); % The estimated v_max and k_m given the v0s from M3
estimatedMichealisMenton = (estimatedV_max .* concentrations) ./ (estimatedV_max + concentrations); % The estimated Michealis-Menton model from the given v0s
sseEstimated = sum((estimatedMichealisMenton - givenV0s) .^ 2); % The sse between our v0s and the given Michealis-Menton model
fprintf("The estimated v_max is %.3f and k_m is %.3f.\n", estimatedV_max, estimatedK_m);
fprintf("The sum squared error between the estimated Michealis Menton and the given v0s is %.3f.\n", sseEstimated);