function [action, outcome, outcome2] = playerDecision(player)
% decision making function, can run multiple times in one turn. make sure
% to run 'playerPriorityChange.m' before running again.
% inputs:   player - player(1) for player 1
%           ** SPECIFY WHICH NUMBER PLAYER
% outputs:  action - string of what the player's decision is
%                   'buy', 'trade', 'play devCard', 'end turn'
%           outcome - string that specifies the action further
%                e.g. for 'buy': '(road, settlement, city or devCard)'
%                e.g. for 'trade': '(name of resource)'
%                e.g. for 'play devCard': '(name of devCard)'
%                       The only three actions with outcomes are 'buy', 'trade' and
%                       'play devCard', otherwise the output is 'none'
%           outcome2 - string that specifies second trade item
%                e.g. for 'trade': '(name of second resource)'
%                       'trade' is the only action that utilizes this space
%                       for a second thing to trade for (players can only
%                       request trade twice in one turn for the sake of the
%                       simulation

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

% second priority
        % the max is kept from the previous loop 
if priorities(1) ~= max         % if the road is not the 1st priority, make
    max2 = priorities(1);       % it the start of the second priority search
    secondPriority = 1;
else
    max2 = priorities(2);       % if the road is already 1st priority, make
    secondPriority = 2;         % the next element max2 priority
end
for iPriority = 1:4     % check all priorities
    if priorities(iPriority) >= max2 && priorities(iPriority) ~= max
        max2 = priorities(iPriority);
        secondPriority = iPriority;
    end
end
% if the next highest priority is a 0, then mark the 
if priorities(secondPriority) == 0
    secondPriority = 0;
end
priorityArray = [firstPriority, secondPriority];
action = 'none'; % initialize action
%% for loop for 1st and 2nd priority, and check to buy!
cardHand = playerHand(player);
load('market.mat');
chosen = false;
for i = 1:2
    if chosen == false %&& player.buyAbility == true
        % if priority is road
        if priorityArray(i) == 1
            resultingCards = cardHand - market.road;        % leftover cards if they were to buy
            if resultingCards(2) >= 0 && resultingCards(5) >=0 && player.stash.road >0  % if player had enough cards
                action = 'buy';
                outcome = 'road';
                chosen = true;
            end
            % if priority is settlement
        elseif priorityArray(i) == 2
            resultingCards = cardHand - market.settlement;
            if resultingCards(2) >= 0 && resultingCards(3) >=0 && resultingCards(4) >=0 && resultingCards(5) >= 0 ...
                && player.stash.settlement > 0 
                action = 'buy';
                outcome = 'settlement';
                chosen = true;
            end
            % if priority is city
        elseif priorityArray(i) == 3
            resultingCards = cardHand - market.city;
            if resultingCards(1) >= 0 && resultingCards(3) >= 0 && player.stash.city > 0 && player.stash.settlement <5 % if there is a 
                action = 'buy';                                                                                % settlement to replace
                outcome = 'city';
                chosen = true;
            end
            % if priority is devCard
        elseif priorityArray(i) == 4
            resultingCards = cardHand - market.devCard;
            if resultingCards(1) >= 0 && resultingCards(3) >= 0 && resultingCards(4) >=0
                action = 'buy';
                outcome = 'devCard';
                chosen = true;
                player.priority.devCard = 1;    % reset devCard priority after buying one!
            end
        end
    end
   
end
outcome2 = 'none';      % because no trade
%% for loop for 1st and 2nd priority, and check to trade
player.buyAbility = false;
if chosen == false  %&& player.tradeAbility == true    % if player cannot buy priorities
    action = 'trade';
    player.usedTrade = player.usedTrade + 1;
    k = 1;      % counter for number of cards needed, to create an array
    for i = 1:2
        % if priority is road
        if priorityArray(i) == 1 && k < 3   % if only 1 outcome has been chosen
            resultingCards = cardHand - market.road;
            % see which cards player wants to trade for
            if resultingCards(2) < 0    % not enough lumber
                cardsNeeded{k} = 'lumber';
                k = k + 1;
            end
            if resultingCards(5) < 0    % not enough brick
                cardsNeeded{k} = 'brick';
                k = k + 1;
            end
            
            % if priority is settlement
        elseif priorityArray(i) == 2 && k < 3
            resultingCards = cardHand - market.settlement;
            if resultingCards(2) < 0
                cardsNeeded{k} = 'lumber';
                k = k + 1;
            end
            if resultingCards(3) < 0 
                cardsNeeded{k} = 'grain';
                k = k + 1;
            end
            if resultingCards(4) < 0 
                cardsNeeded{k} = 'wool';
                k = k + 1;
            end
            if resultingCards(5) < 0
                cardsNeeded{k} = 'brick';
                k = k+1;
            end
            % if priority is city
        elseif priorityArray(i) == 3 && k < 3
            resultingCards = cardHand - market.city;
            if resultingCards(1) < 0 
                cardsNeeded{k} = 'ore';
                k = k+1;
            end
            if resultingCards(3) < 0
                 cardsNeeded{k} = 'grain';
                 k = k+1;
            end
            % if priority is devCard
        elseif priorityArray(i) == 4 && k < 3
            resultingCards = cardHand - market.devCard;
            if resultingCards(1) < 0
                cardsNeeded{k} = 'ore';
                k = k+1;
            end
            if resultingCards(3) < 0
                cardsNeeded{k} = 'grain';
                k = k+1;
            end
            if resultingCards(4) < 0
                cardsNeeded{k} = 'wool';
                k = k+1;
            end
        end
    end
end

% choose 1st and 2nd outcome
% we have an array, cardsNeeded, and we need to choose at random, two of
% the cards
if strcmp(action, 'trade')      % if player is trading
    totalCardsNeeded = length(cardsNeeded);
    firstChoice = 1; % most likely part of first priority!!
    repeat = true;
    if totalCardsNeeded ~= 1                % execute unless only need one card
        while repeat == true
            secondChoiceX = randi(totalCardsNeeded);    % place holder for second choice
            if secondChoiceX ~= firstChoice             % if not choosing the first element again
                secondChoice = secondChoiceX;
                repeat = false;
            end
        end
        outcome2 = cardsNeeded{secondChoice};
    else
        outcome2 = 'none';
    end
    
    outcome = cardsNeeded{firstChoice};
    
    chosen = true;                      % made a choice
    player.tradeAbility = false;       % player can no longer trade this turn
end

%% check for devCards, and play one!
% player can't buy, player has finished trading
if chosen == false && player.devCardAbility == true         % nothing has been chosen and player can still play a devCard
    devCardArray = [player.devCard.knight, player.devCard.roadbuilding,...
        player.devCard.monopoly, player.devCard.yearOfPlenty];  % array of possible devCards
    cardAvailable = false;  % assuming player won't be able to play devCard
    for iCard = 1:20        % the last time card Available is true, they will play that card
        cardChooser = randi(4);
        if devCardArray(cardChooser) ~= 0 % if player has this card
            cardIndex = cardChooser;        % number in array of card
            cardAvailable = true;           % able to play a devCard
        end
    end
    if cardAvailable == true         % player has a development card
        action = 'play devCard';
        switch cardIndex
            case 1
                outcome = 'knight';
            case 2
                outcome = 'roadbuilding';
            case 3
                outcome = 'monopoly';
            case 4
                outcome = 'yearOfPlenty';
        end
        chosen = true;                  % made a choice
        player.devCardAbility = false;  % no longer able to play devCard this turn
    end
end

%% if no options, end turn
if chosen == false
    action = 'end turn';
    outcome = 'none';
end