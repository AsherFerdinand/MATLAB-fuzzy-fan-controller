%% FUZZY FAN CONTROLLER
% Simple 1-input fuzzy controller
% Input: Temperature [°C]
% Output: Fan speed [%]

clear;
clc;
close all;

%% Simulation settings

dt = 0.1;              % simulation time step [s]
t = 0:dt:60;           % simulation time [s]

%% Temperature

% Create a varying temperature.
% It starts around 20°C and gradually becomes hotter.

temperature = 20 + 15*(t/60) + 3*sin(0.3*t);

%% Pre-allocate fan speed

fanSpeed = zeros(size(t));

%% Fuzzy controller

for i = 1:length(t)

    T = temperature(i);

    % ------------------------------------
    % 1. FUZZIFICATION
    % ------------------------------------

    cold = membership_cold(T);
    warm = membership_warm(T);
    hot  = membership_hot(T);

    % ------------------------------------
    % 2. RULE EVALUATION
    % ------------------------------------

    % Rule 1:
    % IF temperature is COLD
    % THEN fan is SLOW

    rule1 = cold;

    % Rule 2:
    % IF temperature is WARM
    % THEN fan is MEDIUM

    rule2 = warm;

    % Rule 3:
    % IF temperature is HOT
    % THEN fan is FAST

    rule3 = hot;

    % ------------------------------------
    % 3. DEFUZZIFICATION
    % ------------------------------------

    % Assign representative fan speeds
    slowSpeed   = 20;
    mediumSpeed = 50;
    fastSpeed   = 100;

    % Weighted average
    numerator = rule1*slowSpeed + ...
                rule2*mediumSpeed + ...
                rule3*fastSpeed;

    denominator = rule1 + rule2 + rule3;

    if denominator == 0
        fanSpeed(i) = 0;
    else
        fanSpeed(i) = numerator / denominator;
    end

end


%% PLOT 1: Temperature and fan speed

figure;

subplot(2,1,1);

plot(t, temperature, 'b', 'LineWidth', 2);

grid on;
xlabel('Time [s]');
ylabel('Temperature [°C]');
title('Temperature over Time');


subplot(2,1,2);

plot(t, fanSpeed, 'r', 'LineWidth', 2);

grid on;
xlabel('Time [s]');
ylabel('Fan Speed [%]');
title('Fuzzy Controller Output');


%% PLOT 2: Membership functions

temperatureRange = 0:0.1:40;

coldMembership = zeros(size(temperatureRange));
warmMembership = zeros(size(temperatureRange));
hotMembership  = zeros(size(temperatureRange));

for i = 1:length(temperatureRange)

    T = temperatureRange(i);

    coldMembership(i) = membership_cold(T);
    warmMembership(i) = membership_warm(T);
    hotMembership(i)  = membership_hot(T);

end

figure;

plot(temperatureRange, coldMembership, ...
    'b', 'LineWidth', 2);

hold on;

plot(temperatureRange, warmMembership, ...
    'g', 'LineWidth', 2);

plot(temperatureRange, hotMembership, ...
    'r', 'LineWidth', 2);

grid on;

xlabel('Temperature [°C]');
ylabel('Membership');

title('Temperature Membership Functions');

legend('Cold', 'Warm', 'Hot');

ylim([0 1.1]);
