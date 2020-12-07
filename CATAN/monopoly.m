function [player] = monopoly(playerNum, player)
% This is the monoploy card function for catan
% Group 3, Travis Chiu, April 23

%% Check to see if player has a monopoly development card
num = playerNum; % Just a shorthand to access the player and dev card struct
check = 0; %On off switch to check if they player has enough resources
if player(num).devCard.monopoly <= 1
    check = 1;
end

%%  Generate random integer to decide what the player will ask for
res = randi(5);

%% Logic
if check == 1
    switch res
        case 1
            for ix = setdiff(1:4,num)
               if player(ix).ore <= 1
                   player(ix).ore = player(ix).ore - 1;
                   player(num).ore = player(num).ore + 1;
               end
            end
        case 2
            for ix = setdiff(1:4,num)
               if player(ix).lumber <= 1
                   player(ix).lumber = player(ix).lumber - 1;
                   player(num).lumber = player(num).lumber + 1;
               end
            end
        case 3
            for ix = setdiff(1:4,num)
               if player(ix).grain <= 1
                   player(ix).grain = player(ix).grain - 1;
                   player(num).grain = player(num).grain + 1;
               end
            end
        case 4
            for ix = setdiff(1:4,num)
               if player(ix).wool <= 1
                   player(ix).wool = player(ix).wool - 1;
                   player(num).wool = player(num).wool + 1;
               end
            end
        case 5
            for ix = setdiff(1:4,num)
               if player(ix).brick <= 1
                   player(ix).brick = player(ix).brick - 1;
                   player(num).brick = player(num).brick + 1;
               end
            end
    end
else
    player = player;
end
            
