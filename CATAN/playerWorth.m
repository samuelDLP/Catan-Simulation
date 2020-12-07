function [worth] = playerWorth(player)
% this function will give a quantitative value to a player based on their
% priority to judge whether trade is favorable or not
% playerWorth ONLY checks the first priority!
% input:    player - player(1) for player 1
%           ** SPECIFY WHICH NUMBER PLAYER
% output:   worth - number of what the cards are worth to the player based
%           on their #1 priority

%% analyze priority
% player will be a 1xX structure
% first priority
priorities = [player.priority.road, player.priority.settlement,...
    player.priority.city, player.priority.devCard]; % array of priorities
max = priorities(1);    % set max to the first element
firstPriority = 1;
for iPriority = 1:4     % check all priorities
    if priorities(iPriority) >= max     % find the new max
        max = priorities(iPriority);    % assign new max value
        firstPriority = iPriority;      % keep track of element number
    end
end
% 1 = road, 2 = settlement, 3 = city, 4 = devCard, 0 = priority is 0

%% find worth
hand = playerHand(player);
load('market.mat');

ranOutOfCards = false;      % initialize
worth = 0;                  % initialize
if firstPriority == 1       % if road
    leftover = hand - market.road;
    while ranOutOfCards == false
        if leftover(2) >= 0 && leftover(5) >=0 && player.stash.road >=0
            % if player has more cards left
            worth = worth + 1;
            leftover = leftover - market.road;
        else    % if player does not have more cards left
            if leftover(2) >= 0 
                worth = worth + .5;
            end
            if leftover(5) >= 0
                worth = worth + .5;
            end
            ranOutOfCards = true;
        end
    end
elseif firstPriority == 2   % if settlement
    leftover = hand - market.settlement;
    while ranOutOfCards == false
        if leftover(2) >= 0 && leftover(3) >=0 && leftover(4) >=0 && leftover(5) >= 0
            worth = worth + 1;
            leftover = leftover - market.settlement;
        else
            if leftover(2) >= 0 
                worth = worth + .25;    % add a quarter because a settlement
            end                         % needs 4 total pieces to buy
            if leftover(3) >= 0 
                worth = worth + .25;
            end
            if leftover(4) >= 0 
                worth = worth + .25;
            end
            if leftover(5) >= 0 
                worth = worth + .25;
            end
            ranOutOfCards = true;
        end
    end
elseif firstPriority == 3   % if city
    leftover = hand - market.city;
    while ranOutOfCards == false
        if leftover(1) >= 0 && leftover(3) >=0
            worth = worth + 1;
            leftover = leftover - market.city;
        else
            if leftover(1) >= 0 
                worth = worth + .6;    % add 3/5
            end                  
            if leftover(3) >= 0 
                worth = worth + .4;     % add 2/5
            end
            ranOutOfCards = true;
        end
    end
elseif firstPriority == 4   % if devCard
    leftover = hand - market.devCard;
    while ranOutOfCards == false
        if leftover(1) >= 0 && leftover(3) >=0 && leftover(4) >=0
            worth = worth + 1;
            leftover = leftover - market.devCard;
        else
            if leftover(2) >= 0 
                worth = worth + .333;    % add a third because a devCard
            end                         % needs 3 total pieces to buy
            if leftover(3) >= 0 
                worth = worth + .333;
            end
            if leftover(4) >= 0 
                worth = worth + .333;;
            end
            ranOutOfCards = true;
        end
    end
end

