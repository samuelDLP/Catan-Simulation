function [player, tile, map] = roadbuilding(playerNum, player , tile, point, map)
% This is the knight function for catan
% Group 3, Travis Chiu, April 23

%% Check if player has a knight development card
num = playerNum; % Just a shorthand to access the player and dev card struct
check = 0; %On off switch to check if they player has enough resources
if player(num).devCard.knight <= 1
    if player(num).stash.road <= 1
        check = 1;
    end
end

%% Run road placement function twice
if check == 1
    [playerNum, tile, map] = roadPlacement(playerNum, tile, point, map);
    [playerNum, tile, map] = roadPlacement(playerNum, tile, point, map);
else
    player = player;
end

