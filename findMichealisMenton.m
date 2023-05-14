function [v_max,k_m] = findMichealisMenton(concentrations,v0s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program Description 
%  Find the Michealis-Menton parameters from the given data.
% Function Call
%  [v_max,k_m] = findV0(concentrations, v0s)
% Input Arguments
%  concentrations - the given x-axis of concentrations
%  v0s - the given y-axis of initial velocities
% Output Arguments
%  v_max - the estimated Michealis-Menton v_max parameter
%  k_m - the estimated Michealis-Menton k_m parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
v_max = v0s(end); % The Michealis-Menton v_max parameter
k_mTarget = v_max / 2; % The theoretical k_m to find

linearX = log10(concentrations); % The linearized concentrations
linearY = v0s; % The linearized velocities

linearCoeffs = polyfit(linearX,linearY,1); % The linear regression coefficents
m = linearCoeffs(1); % The slope of the linear regression
b = linearCoeffs(2); % The y-intercept of the linear regression
k_m = 10 ^ ((k_mTarget - b) / m); % The estimated k_m Michealis-Menton parameter