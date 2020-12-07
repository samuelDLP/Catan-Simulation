function currentRoll = rollDice()

% rollDice.m
% 

% 4/11/2019
% Author: Paige Finley



%% create 2 randi functions for dice

die1 = randi(6);
die2 = randi(6);
currentRoll = die1 + die2;