function [player] = vp(playerNum, player)
% This is the victory point card function for catan
% Group 3, Travis Chiu, April 23

%% Check if player has a vp development card
num = playerNum; % Just a shorthand to access the player and dev card struct
check = 0; %On off switch to check if they player has enough resources
if player(num).devCard.vp <= 1
    check = 1;
end

%% Run if check is one
if check == 1
    player(num).vp.devCard = player(num).vp.devCard + 1;
    player(num).devCard.vp = player(num).devCard.vp - 1;
else
    player = player;
end