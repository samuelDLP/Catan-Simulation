function [player, deck] = yearOfPlenty(playerNum, player, deck)
% This is the yop card function for catan
% Group 3, Travis Chiu, April 23

%% Check if player has a vp development card
num = playerNum; % Just a shorthand to access the player and dev card struct
check = 0; %On off switch to check if they player has enough resources
if player(num).devCard.vp <= 1
    check = 1;
end

%% Run if check is one
if check == 1
    resOne = randi(5);
    resTwo = randi(5);
    switch resOne
        case 1
            player(num).ore = player(num).ore + 1;
            deck.ore = deck.ore - 1;
        case 2
            player(num).lumber = player(num).lumber + 1;
            deck.lumber = deck.lumber - 1;
        case 3
            player(num).grain = player(num).grain + 1;
            deck.grain = deck.grain - 1;
        case 4
            player(num).wool = player(num).wool + 1;
            deck.wool = deck.wool - 1;
        case 5
            player(num).brick = player(num).brick + 1;
            deck.brick = deck.brick - 1;
    end
    switch resTwo
        case 1
            player(num).ore = player(num).ore + 1;
            deck.ore = deck.ore - 1;
        case 2
            player(num).lumber = player(num).lumber + 1;
            deck.lumber = deck.lumber - 1;
        case 3
            player(num).grain = player(num).grain + 1;
            deck.grain = deck.grain - 1;
        case 4
            player(num).wool = player(num).wool + 1;
            deck.wool = deck.wool - 1;
        case 5
            player(num).brick = player(num).brick + 1;
            deck.brick = deck.brick - 1;
    end
else
    player = player;
end