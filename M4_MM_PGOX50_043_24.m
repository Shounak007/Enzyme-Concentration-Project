function M4_MM_PGOX50_043_24()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description 
%  Compare our estimation algorithm with the given example data for
%  PGOX50.
% Function Call 
%  M4_MM_PGOX50_043_24()
% Input Arguments
%  
% Output Arguments
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = readmatrix('Data_PGOX50_enzyme.csv'); % The given PGOX50 data

concentrations = data(5,2:end); % The given concentrations
enzymeData = data(8:end,2:end); % The given exprimental enzyme data

givenV0s = [0.025,0.049,0.099,0.176,0.329,0.563,0.874,1.192,1.361,1.673]; % The list of v0s given by M4
given_vmax = 1.806; % The given v_max
given_km = 269.74; % The given k_m

[v_max,k_m,v0s] = M4_Algorithm_043_24(enzymeData,concentrations,6); % The v_max,k_m,and v0s from the Algorithms

for k = 1:10
    percent_error = abs(v0s(k) - givenV0s(k)) / givenV0s(k) * 100; % The percent error between estimated v0s and the given v0s
    fprintf("V0,%d: %.2f, %.2f error\n", k, v0s(k), percent_error);
end

percent_error_vmax = abs(v_max - given_vmax) / given_vmax * 100;
percent_error_km = abs(k_m - given_km) / given_km * 100;

fprintf("Percent Error for v_max: %.2f %.2f\n", v_max, percent_error_vmax);
fprintf("Percent Error for k_m: %.2f %.2f\n", k_m, percent_error_km);

