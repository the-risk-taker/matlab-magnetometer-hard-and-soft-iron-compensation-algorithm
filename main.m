%% Author: Mateusz Patyk, 2018

clc, close all, clear variables

%%
addpath('razor-9dof-ahrs/'); 

%% IMPORT FILE - READ README FIRST!

fileName = 'myData/beforeCallib1.txt';
[Time, X_axis, Y_axis, Z_axis] = importMyFile(fileName);

%% PLOT SPHERE AND PLANES HERE:
figure(1);

% It depends on used gain/scale.
dataRange = [-800 800];

subplot(2, 3, 1:3);
    scatter3(X_axis, Y_axis, Z_axis, '.');
    xlabel('X'); ylabel('Y'); zlabel('Z');
    axis([dataRange dataRange]);
    grid on;

subplot(2, 3, 4);
    scatter(X_axis, Y_axis, '.');
    xlabel('X'); ylabel('Y');
    axis([dataRange dataRange]);
    grid on;

subplot(2, 3, 5);
    scatter(X_axis ,Z_axis, '.');
    xlabel('X'); ylabel('Z');
    axis([dataRange dataRange]);
    grid on;

subplot(2, 3, 6);
    scatter(Y_axis, Z_axis, '.');
    axis([dataRange dataRange]);
    grid on;

%% 
figure(2);
scatter(X_axis, Y_axis, 'r.'); hold on;
scatter(X_axis, Z_axis, 'g.'); hold on;
scatter(Y_axis, Z_axis, 'b.');
legend('XY', 'XZ', 'YZ');
axis([dataRange dataRange]);
grid on;

%%
run Calibration.m