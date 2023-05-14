function M4_main_043_24()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description 
%  Plots the v0s and Michealis-Menton model of 5 enzymes.
% Function Call
%  M4_main_043_24()
% Input Arguments
%  
% Output Arguments
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
rawData = readmatrix('Data_nextGen_KEtesting_allresults.csv', NumHeaderLines=0); % The given enzyme data

v0s = zeros(1,100); % The list of v0s
v_max = zeros(1,10); % The list of Michealis-Menton v_max parameters
k_m = zeros(1,10); % The list of Michealis-Menton k_m parameters
concentrations = rawData(3,2:11); % The list of concentrations
data = rawData(5:end,:); % The enzyme experimental data

deltaTime = 6; % The time interval for the algorithm to denoise
for x = 1:10 % Loop over each enzyme
    section = data(:,((x - 1)*10 + 2):(x*10 + 1));
    [v1,k1,v01] = M4_Algorithm_043_24(section,concentrations,deltaTime);
    v_max(x) = v1;
    k_m(x) = k1;
    for k = 1:10
        v0s(((x - 1) * 10) + k) = v01(k);
    end
end

%Combine two tests
final_vmax = zeros(1,5); % The final 5 enzyme v_max
final_km = zeros(1,5); % The final 5 enzyme km
final_v0s = zeros(1,50); % The final 5 v0s list

for k = 0:4
    for w = 1:10
        final_v0s(w + k * 10) = (v0s(w + k * 20) + v0s(w + k * 20 + 10)) / 2;
    end
end

enzyme_names = ['A','B','C','D','E']; % The letters of the enzyme names
for k = 1:5 % Loop over each final enzyme
    final_vmax(k) = (v_max(k * 2 - 1) + v_max(k * 2)) / 2;
    final_km(k) = (k_m(k * 2 - 1) + k_m(k * 2)) / 2;
    plotMichealisMenton("Relationship of Enzyme " + enzyme_names(k) + " Concentration Velocity", final_v0s(((k - 1) * 10 + 1):(k * 10)), concentrations,final_vmax(k),final_km(k));
end

fprintf("V_max: \n");
disp(final_vmax)
fprintf("K_m: \n");
disp(final_km)
    