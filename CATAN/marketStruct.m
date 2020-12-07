% marketStruct.m
% creates a structure that keeps track of how much each item costs
%   Author: Samuel De La Paz

%% create structure

market.road = [0, 1, 0, 0, 1];
market.settlement = [0, 1, 1, 1, 1];
market.city = [3, 0, 2, 0, 0];
market.devCard = [1, 0, 1, 1, 0];

save('market', 'market');