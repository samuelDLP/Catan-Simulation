function [player, devCard] = buyDevCard(player, devCard)
% This function takes in current playerNumber, player struct, and dev card
% struct to see if they have the resources to buy, buy if avaliable, and
% update both struct afterwards,
% example use: [player(#), devCard] = buyDevCard(player(#), devCard)
% Group 3, Travis Chiu, April 11

%% Check if player has the resources to buy
num = player.number; % Just a shorthand to access the player and dev card struct
check = 0; %On off switch to check if they player has enough resources
if player.ore >= 1
    if player.wool >= 1
        if player.grain >= 1
            check = 1;
        end
    end
end

%% Load development cards to see which ones are avaliable
knight = devCard.knight;
vp = devCard.vp;
rb = devCard.roadBuilding;
mono = devCard.monopoly;
yop = devCard.yearsOfPlenty;

%% Generate randomly what dev card player gets
totalNum = knight + vp + rb + mono + yop;



%% Update that player's array take that dev card out of the pile
if check == 1  && totalNum > 0
    draw = randi(totalNum);
    if draw < knight && knight > 0 % Draw a knight
        player.devCard.knight = player.devCard.knight +1;
        devCard.knight = devCard.knight - 1;
    elseif draw < knight + vp && vp > 0% Draw a VP 
        player.devCard.vp = player.devCard.vp +1;
        devCard.vp = devCard.vp - 1;
    elseif draw < knight + vp + rb && rb > 0 % Draw a rb
        player.devCard.roadbuilding = player.devCard.roadbuilding +1;
        devCard.roadBuilding = devCard.roadBuilding - 1;
    elseif draw < knight + vp + rb + mono && mono > 0%Draw a mono
        player.devCard.monopoly = player.devCard.monopoly +1;
        devCard.monopoly = devCard.monopoly - 1;
    elseif draw < knight + vp + rb + mono + yop && yop > 0 %Draw a yop
        player.devCard.yearOfPlenty = player.devCard.yearOfPlenty +1;
        devCard.yearsOfPlenty = devCard.yearsOfPlenty - 1;
    end
end





