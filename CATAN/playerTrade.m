function [playerStruct, deck] = playerTrade(playerStruct, playerN, outcome, outcome2, deck, point)
% see if player has enough to trade!
% check priority again, trade twice only
% only asks 2 players each time (random)
% input:    playerStruct - just put player there. the whole player struct
%           playerN - input what number the player is
%           outcome - determined by the playerDecision function
%           outcome2 - determined by the playerDecision function
%           deck - updates if trades with a port
% output:   playerStruct - updated playerStruct after trading of the player
%           trading and the players they traded with
%           deck - updates the deck if it trades with a port

% improvements: trade with players for outcome2
%% analyze current worth
load('port.mat');
%load('point');
% point(1).occupation = 2;     for testing the port function
playerA = playerStruct(playerN);
preTradeWorthA = playerWorth(playerA);
handA = playerHand(playerA);
currentDeck = [deck.ore, deck.lumber, deck.grain, deck.wool, deck.brick];
acquiredOutcome = false;
acquiredOutcome2 = false;
playerA.usedTrade = playerA.usedTrade + 1;
% desired card #1 is outcome
%% find waste cards
% in other words, see if the player can trade or not, then save cards
desiredCards = [0, 0, 0, 0, 0];
if strcmp(outcome, 'ore')
    desiredCards = desiredCards + [1, 0, 0, 0, 0];
    outcomeN = 1;
elseif strcmp(outcome, 'lumber')
    desiredCards = desiredCards + [0, 1, 0, 0, 0];
    outcomeN = 2;
elseif strcmp(outcome, 'grain')
    desiredCards = desiredCards + [0, 0, 1, 0, 0];
    outcomeN = 3;
elseif strcmp(outcome, 'wool')
    desiredCards = desiredCards + [0, 0, 0, 1, 0];
    outcomeN = 4;
elseif strcmp(outcome, 'brick')
    desiredCards = desiredCards + [0, 0, 0, 0, 1];
    outcomeN = 5;
end
if strcmp(outcome2, 'ore')
    desiredCards = desiredCards + [1, 0, 0, 0, 0];
    outcome2N = 1;
elseif strcmp(outcome2, 'lumber')
    desiredCards = desiredCards + [0, 1, 0, 0, 0];
    outcome2N = 2;
elseif strcmp(outcome2, 'grain')
    desiredCards = desiredCards + [0, 0, 1, 0, 0];
    outcome2N = 3;
elseif strcmp(outcome2, 'wool')
    desiredCards = desiredCards + [0, 0, 0, 1, 0];
    outcome2N = 4;
elseif strcmp(outcome2, 'brick')
    desiredCards = desiredCards + [0, 0, 0, 0, 1];
    outcome2N = 5;
else
    outcome2N = 0;
end

tradeCards = [1, 1, 1, 1, 1] - desiredCards; % find other three possible cards to trade with
% check to see if player has these cards
tradeA = {false, false, false, false, false};
if tradeCards(1) == 1   % if player wants to trade this resource
    if playerA.ore > 0  % if player has the resource to trade
        tradeA{1} = true;
    end
end
if tradeCards(2) == 1
    if playerA.lumber > 0
        tradeA{2} = true;
    end
end
if tradeCards(3) == 1
    if playerA.grain > 0
        tradeA{3} = true;
    end
end
if tradeCards(4) == 1
    if playerA.wool > 0
        tradeA{4} = true;
    end
end
if tradeCards(5) == 1
    if playerA.brick > 0
        tradeA{5} = true;
    end
end

% now we have an array e.g. {true, false, false, false, true} with each
% element lining up with one of the resources.
% if all cards are false, cannot trade
tradeAbilityA = false;
for ix = 1:5
    if tradeA{ix} == true
        tradeAbilityA = true;
    end
end

if tradeAbilityA == true
    %% see if player is at a port, or more
    atAPort = false;
    k = 1;
    for iPort = 1:9
        portPoints = port(iPort).points;
        for iPoint = 1:2
            pointCheck = portPoints(iPoint);
            if point(pointCheck).occupation == playerN
                portArray(k) = iPoint;          % create an array of which ports
                k = k+1;                        % playerN is at (probs 1 or 2)
                atAPort = true;
            end
        end
        
    end
    % if at a port, see if have enough to trade
    if atAPort == true                  % if playerA is at a port at all
        portN = length(portArray);      % find how many ports
        for iTrade = 1:portN            % for the first port
            if strcmp(port(portArray(iTrade)).input{1}, '?') % if it's a random port
                % if the port is a ?
                for iResource = 1:5                          % go through the resources
                    if tradeA{iResource} == true && handA(iResource) >= 3
                        % if player wants to trade, is abble to trade, and
                        % deck has enough resources
                        if currentDeck(outcomeN) > 0 && acquiredOutcome == false
                            if iResource == 1
                                playerA.ore = playerA.ore - 3;
                                deck.ore = deck.ore + 3;
                                playerA.usedPort = playerA.usedPort + 1;
                            elseif iResource == 2
                                playerA.lumber = playerA.lumber - 3;
                                deck.lumber = deck.lumber + 3;
                                playerA.usedPort = playerA.usedPort + 1;
                            elseif iResource == 3
                                playerA.grain = playerA.grain - 3;
                                deck.grain = deck.grain + 3;
                                playerA.usedPort = playerA.usedPort + 1;
                            elseif iResource == 4
                                playerA.wool = playerA.wool -3;
                                deck.wool = deck.wool + 3;
                                playerA.usedPort = playerA.usedPort + 1;
                            elseif iResource ==5
                                playerA.brick = playerA.brick - 3;
                                deck.brick = deck.brick + 3;
                                playerA.usedPort = playerA.usedPort + 1;
                            end
                            if outcomeN == 1
                                deck.ore = deck.ore - 1;
                                playerA.ore = playerA.ore + 1;
                            elseif outcomeN == 2
                                deck.lumber = deck.lumber - 1;
                                playerA.lumber = playerA.lumber + 1;
                            elseif outcomeN == 3
                                deck.grain = deck.grain - 1;
                                playerA.grain = playerA.grain + 1;
                            elseif outcomeN == 4
                                deck.wool = deck.wool - 1;
                                playerA.wool = playerA.wool + 1;
                            elseif outcomeN ==5
                                deck.brick = deck.brick - 1;
                                playerA.brick = playerA.brick + 1;
                            end
                            acquiredOutcome = true;
                        elseif outcome2N ~= 0
                            if currentDeck(outcome2N) > 0 && acquiredOutcome2 == false && outcome2N ~= 0
                                if iResource == 1
                                    playerA.ore = playerA.ore - 3;
                                    deck.ore = deck.ore + 3;
                                    playerA.usedPort = playerA.usedPort + 1;
                                elseif iResource == 2
                                    playerA.lumber = playerA.lumber - 3;
                                    deck.lumber = deck.lumber + 3;
                                    playerA.usedPort = playerA.usedPort + 1;
                                elseif iResource == 3
                                    playerA.grain = playerA.grain - 3;
                                    deck.grain = deck.grain + 3;
                                    playerA.usedPort = playerA.usedPort + 1;
                                elseif iResource == 4
                                    playerA.wool = playerA.wool -3;
                                    deck.wool = deck.wool + 3;
                                    playerA.usedPort = playerA.usedPort + 1;
                                elseif iResource ==5
                                    playerA.brick = playerA.brick - 3;
                                    deck.brick = deck.brick + 3;
                                    playerA.usedPort = playerA.usedPort + 1;
                                end
                                if outcome2N == 1
                                    deck.ore = deck.ore - 1;
                                    playerA.ore = playerA.ore + 1;
                                elseif outcome2N == 2
                                    deck.lumber = deck.lumber - 1;
                                    playerA.lumber = playerA.lumber + 1;
                                elseif outcome2N == 3
                                    deck.grain = deck.grain - 1;
                                    playerA.grain = playerA.grain + 1;
                                elseif outcome2N == 4
                                    deck.wool = deck.wool - 1;
                                    playerA.wool = playerA.wool + 1;
                                elseif outcome2N ==5
                                    deck.brick = deck.brick - 1;
                                    playerA.brick = playerA.brick + 1;
                                end
                            end
                            acquiredOutcome2 = true;
                        end
                    end
                end
            else
                % if the port is a resource
                if strcmp(port(portArray(iTrade)).input{1}, 'ore')
                    if tradeA{1} == true && handA(1) >= 3
                        % if player wants to trade, is abble to trade, and
                        % deck has enough resources
                        if currentDeck(outcomeN) > 0 && acquiredOutcome == false
                            playerA.ore = playerA.ore - 2;
                            deck.ore = deck.ore + 2;        % what player trades in
                            playerA.usedPort = playerA.usedPort + 1;
                            if outcomeN == 1
                                deck.ore = deck.ore - 1;
                                playerA.ore = playerA.ore + 1;
                            elseif outcomeN == 2
                                deck.lumber = deck.lumber - 1;
                                playerA.lumber = playerA.lumber + 1;
                            elseif outcomeN == 3
                                deck.grain = deck.grain - 1;
                                playerA.grain = playerA.grain + 1;
                            elseif outcomeN == 4
                                deck.wool = deck.wool - 1;
                                playerA.wool = playerA.wool + 1;
                            elseif outcomeN ==5
                                deck.brick = deck.brick - 1;
                                playerA.brick = playerA.brick + 1;
                            end
                            acquiredOutcome = true;
                        elseif outcome2N ~= 0
                            if currentDeck(outcome2N) > 0 && acquiredOutcome2 == false && outcome2N ~= 0
                                playerA.ore = playerA.ore - 2;
                                deck.ore = deck.ore + 2;
                                playerA.usedPort = playerA.usedPort + 1;
                                if outcome2N == 1
                                    deck.ore = deck.ore - 1;
                                    playerA.ore = playerA.ore + 1;
                                elseif outcome2N == 2
                                    deck.lumber = deck.lumber - 1;
                                    playerA.lumber = playerA.lumber + 1;
                                elseif outcome2N == 3
                                    deck.grain = deck.grain - 1;
                                    playerA.grain = playerA.grain + 1;
                                elseif outcome2N == 4
                                    deck.wool = deck.wool - 1;
                                    playerA.wool = playerA.wool + 1;
                                elseif outcome2N ==5
                                    deck.brick = deck.brick - 1;
                                    playerA.brick = playerA.brick + 1;
                                end
                                acquiredOutcome2 = true;
                            end
                        end
                    end
                elseif strcmp(port(portArray(iTrade)).input{1}, 'lumber')
                    if tradeA{2} == true && handA(2) >= 3
                        % if player wants to trade, is abble to trade, and
                        % deck has enough resources
                        if currentDeck(outcomeN) > 0 && acquiredOutcome == false
                            playerA.lumber = playerA.lumber - 2;
                            deck.lumber = deck.lumber + 2;        % what player trades in
                            playerA.usedPort = playerA.usedPort + 1;
                            if outcomeN == 1
                                deck.ore = deck.ore - 1;
                                playerA.ore = playerA.ore + 1;
                            elseif outcomeN == 2
                                deck.lumber = deck.lumber - 1;
                                playerA.lumber = playerA.lumber + 1;
                            elseif outcomeN == 3
                                deck.grain = deck.grain - 1;
                                playerA.grain = playerA.grain + 1;
                            elseif outcomeN == 4
                                deck.wool = deck.wool - 1;
                                playerA.wool = playerA.wool + 1;
                            elseif outcomeN ==5
                                deck.brick = deck.brick - 1;
                                playerA.brick = playerA.brick + 1;
                            end
                            acquiredOutcome = true;
                        elseif outcome2N ~= 0
                            if currentDeck(outcome2N) > 0 && acquiredOutcome2 == false  && outcome2N ~= 0
                                playerA.lumber = playerA.lumber - 2;
                                deck.lumber = deck.lumber + 2;
                                if outcome2N == 1
                                    deck.ore = deck.ore - 1;
                                    playerA.ore = playerA.ore + 1;
                                elseif outcome2N == 2
                                    deck.lumber = deck.lumber - 1;
                                    playerA.lumber = playerA.lumber + 1;
                                elseif outcome2N == 3
                                    deck.grain = deck.grain - 1;
                                    playerA.grain = playerA.grain + 1;
                                elseif outcome2N == 4
                                    deck.wool = deck.wool - 1;
                                    playerA.wool = playerA.wool + 1;
                                elseif outcome2N ==5
                                    deck.brick = deck.brick - 1;
                                    playerA.brick = playerA.brick + 1;
                                end
                                acquiredOutcome2 = true;
                            end
                        end
                    end
                elseif strcmp(port(portArray(iTrade)).input{1}, 'grain')
                    if tradeA{3} == true && handA(3) >= 3
                        % if player wants to trade, is abble to trade, and
                        % deck has enough resources
                        if currentDeck(outcomeN) > 0 && acquiredOutcome == false
                            playerA.grain = playerA.grain - 2;
                            deck.grain = deck.grain + 2;        % what player trades in
                            playerA.usedPort = playerA.usedPort + 1;
                            if outcomeN == 1
                                deck.ore = deck.ore - 1;
                                playerA.ore = playerA.ore + 1;
                            elseif outcomeN == 2
                                deck.lumber = deck.lumber - 1;
                                playerA.lumber = playerA.lumber + 1;
                            elseif outcomeN == 3
                                deck.grain = deck.grain - 1;
                                playerA.grain = playerA.grain + 1;
                            elseif outcomeN == 4
                                deck.wool = deck.wool - 1;
                                playerA.wool = playerA.wool + 1;
                            elseif outcomeN ==5
                                deck.brick = deck.brick - 1;
                                playerA.brick = playerA.brick + 1;
                            end
                            acquiredOutcome = true;
                        elseif outcome2N ~= 0
                            if currentDeck(outcome2N) > 0 && acquiredOutcome2 == false  && outcome2N ~= 0
                                playerA.grain = playerA.grain - 2;
                                deck.grain = deck.grain + 2;
                                if outcome2N == 1
                                    deck.ore = deck.ore - 1;
                                    playerA.ore = playerA.ore + 1;
                                elseif outcome2N == 2
                                    deck.lumber = deck.lumber - 1;
                                    playerA.lumber = playerA.lumber + 1;
                                elseif outcome2N == 3
                                    deck.grain = deck.grain - 1;
                                    playerA.grain = playerA.grain + 1;
                                elseif outcome2N == 4
                                    deck.wool = deck.wool - 1;
                                    playerA.wool = playerA.wool + 1;
                                elseif outcome2N ==5
                                    deck.brick = deck.brick - 1;
                                    playerA.brick = playerA.brick + 1;
                                end
                                acquiredOutcome2 = true;
                            end
                        end
                    end
                elseif strcmp(port(portArray(iTrade)).input{1}, 'wool')
                    if tradeA{4} == true && handA(4) >= 3
                        % if player wants to trade, is abble to trade, and
                        % deck has enough resources
                        if currentDeck(outcomeN) > 0 && acquiredOutcome == false
                            playerA.wool = playerA.wool - 2;
                            deck.wool = deck.wool + 2;        % what player trades in
                            playerA.usedPort = playerA.usedPort + 1;
                            if outcomeN == 1
                                deck.ore = deck.ore - 1;
                                playerA.ore = playerA.ore + 1;
                            elseif outcomeN == 2
                                deck.lumber = deck.lumber - 1;
                                playerA.lumber = playerA.lumber + 1;
                            elseif outcomeN == 3
                                deck.grain = deck.grain - 1;
                                playerA.grain = playerA.grain + 1;
                            elseif outcomeN == 4
                                deck.wool = deck.wool - 1;
                                playerA.wool = playerA.wool + 1;
                            elseif outcomeN ==5
                                deck.brick = deck.brick - 1;
                                playerA.brick = playerA.brick + 1;
                            end
                            acquiredOutcome = true;
                        elseif outcome2N ~= 0
                            if currentDeck(outcome2N) > 0 && acquiredOutcome2 == false  && outcome2N ~= 0
                                playerA.wool = playerA.wool - 2;
                                deck.wool = deck.wool + 2;
                                if outcome2N == 1
                                    deck.ore = deck.ore - 1;
                                    playerA.ore = playerA.ore + 1;
                                elseif outcome2N == 2
                                    deck.lumber = deck.lumber - 1;
                                    playerA.lumber = playerA.lumber + 1;
                                elseif outcome2N == 3
                                    deck.grain = deck.grain - 1;
                                    playerA.grain = playerA.grain + 1;
                                elseif outcome2N == 4
                                    deck.wool = deck.wool - 1;
                                    playerA.wool = playerA.wool + 1;
                                elseif outcome2N ==5
                                    deck.brick = deck.brick - 1;
                                    playerA.brick = playerA.brick + 1;
                                end
                                acquiredOutcome2 = true;
                            end
                        end
                    end
                elseif strcmp(port(portArray(iTrade)).input{1}, 'brick')
                    if tradeA{5} == true && handA(5) >= 3
                        % if player wants to trade, is abble to trade, and
                        % deck has enough resources
                        if currentDeck(outcomeN) > 0 && acquiredOutcome == false
                            playerA.brick = playerA.brick - 2;
                            deck.brick = deck.brick + 2;        % what player trades in
                            playerA.usedPort = playerA.usedPort + 1;
                            if outcomeN == 1
                                deck.ore = deck.ore - 1;
                                playerA.ore = playerA.ore + 1;
                            elseif outcomeN == 2
                                deck.lumber = deck.lumber - 1;
                                playerA.lumber = playerA.lumber + 1;
                            elseif outcomeN == 3
                                deck.grain = deck.grain - 1;
                                playerA.grain = playerA.grain + 1;
                            elseif outcomeN == 4
                                deck.wool = deck.wool - 1;
                                playerA.wool = playerA.wool + 1;
                            elseif outcomeN ==5
                                deck.brick = deck.brick - 1;
                                playerA.brick = playerA.brick + 1;
                            end
                            acquiredOutcome = true;
                        elseif outcome2N ~= 0
                            if currentDeck(outcome2N) > 0 && acquiredOutcome2 == false  && outcome2N ~= 0
                                playerA.brick = playerA.brick - 2;
                                deck.brick = deck.brick + 2;
                                if outcome2N == 1
                                    deck.ore = deck.ore - 1;
                                    playerA.ore = playerA.ore + 1;
                                elseif outcome2N == 2
                                    deck.lumber = deck.lumber - 1;
                                    playerA.lumber = playerA.lumber + 1;
                                elseif outcome2N == 3
                                    deck.grain = deck.grain - 1;
                                    playerA.grain = playerA.grain + 1;
                                elseif outcome2N == 4
                                    deck.wool = deck.wool - 1;
                                    playerA.wool = playerA.wool + 1;
                                elseif outcome2N ==5
                                    deck.brick = deck.brick - 1;
                                    playerA.brick = playerA.brick + 1;
                                end
                                acquiredOutcome2 = true;
                            end
                        end
                    end
                end
            end
        end
        %% Re check resources
        % check to see if player has these cards
        tradeA = {false, false, false, false, false};
        if tradeCards(1) == 1   % if player wants to trade this resource
            if playerA.ore > 0  % if player has the resource to trade
                tradeA{1} = true;
            end
        end
        if tradeCards(2) == 1
            if playerA.lumber > 0
                tradeA{2} = true;
            end
        end
        if tradeCards(3) == 1
            if playerA.grain > 0
                tradeA{3} = true;
            end
        end
        if tradeCards(4) == 1
            if playerA.wool > 0
                tradeA{4} = true;
            end
        end
        if tradeCards(5) == 1
            if playerA.brick > 0
                tradeA{5} = true;
            end
        end
        
        % now we have an array e.g. {true, false, false, false, true} with each
        % element lining up with one of the resources.
        % if all cards are false, cannot trade
        tradeAbilityA = false;
        for ix = 1:5
            if tradeA{ix} == true
                tradeAbilityA = true;
            end
        end
        
        if acquiredOutcome == false && tradeAbilityA == true
            %% choose a player to trade with
            % first player
            hasTraded = false;
            chosen = false;
            while chosen == false
                playerBN = randi(4);    % chose first player
                if playerBN ~= playerN
                    chosen = true;
                end
            end
            playerB = playerStruct(playerBN);
            %% player who was asked analyzes
            % outcome
            % offer up card
            
            for iAsk = 1:5  % for 5 resources
                if tradeA{iAsk} == true && hasTraded == false && iAsk ~= outcomeN
                    % if playerA wants to trade and has not traded yet
                    % and iAsk cannot be the same as outcomeN (can't trade same
                    % thing)
                    playerBGet = iAsk;
                    playerBGive = outcomeN;
                    playerBTest = playerB;
                    playerBPreTrade = playerWorth(playerB);
                    
                    % add the resource
                    if playerBGet == 1
                        playerBTest.ore = playerBTest.ore + 1;
                    elseif playerBGet == 2
                        playerBTest.lumber = playerBTest.lumber + 1;
                    elseif playerBGet == 3
                        playerBTest.grain = playerBTest.grain + 1;
                    elseif playerBGet == 4
                        playerBTest.wool = playerBTest.wool + 1;
                    elseif playerBGet == 5
                        playerBTest.brick = playerBTest.brick + 1;
                    end
                    
                    % take away the resource
                    if playerBGive == 1
                        playerBTest.ore = playerBTest.ore - 1;
                    elseif playerBGive == 2
                        playerBTest.lumber = playerBTest.lumber - 1;
                    elseif playerBGive == 3
                        playerBTest.grain = playerBTest.grain - 1;
                    elseif playerBGive == 4
                        playerBTest.wool = playerBTest.wool - 1;
                    elseif playerBGive == 5
                        playerBTest.brick = playerBTest.brick - 1;
                    end
                    % re-evaluate worth
                    playerBPostTrade = playerWorth(playerBTest);
                    
                    % does playerB have enough cards?
                    playerBTrade = false;
                    if playerBGive == 1
                        if playerB.ore > 0
                            playerBTrade = true;
                        end
                    elseif playerBGive == 2
                        if playerB.lumber > 0
                            playerBTrade = true;
                        end
                    elseif playerBGive == 3
                        if playerB.grain > 0
                            playerBTrade = true;
                        end
                    elseif playerBGive == 4
                        if playerB.wool > 0
                            playerBTrade = true;
                        end
                    elseif playerBGive == 5
                        if playerB.brick > 0
                            playerBTrade = true;
                        end
                    end
                    
                    
                    % is the trade worth it?
                    if playerBPostTrade > playerBPreTrade && playerBTrade == true
                        hasTraded = true;
                        playerA.usedTrade = playerA.usedTrade + 1;
                        % add the resource
                        if playerBGet == 1
                            playerB.ore = playerB.ore + 1;
                        elseif playerBGet == 2
                            playerB.lumber = playerB.lumber + 1;
                        elseif playerBGet == 3
                            playerB.grain = playerB.grain + 1;
                        elseif playerBGet == 4
                            playerB.wool = playerB.wool + 1;
                        elseif playerBGet == 5
                            playerB.brick = playerB.brick + 1;
                        end
                        % take away the resource
                        if playerBGive == 1
                            playerB.ore = playerB.ore - 1;
                        elseif playerBGive == 2
                            playerB.lumber = playerB.lumber - 1;
                        elseif playerBGive == 3
                            playerB.grain = playerB.grain - 1;
                        elseif playerBGive == 4
                            playerB.wool = playerB.wool - 1;
                        elseif playerBGive == 5
                            playerB.brick = playerB.brick - 1;
                        end
                        % add to  playerA
                        if playerBGive == 1
                            playerA.ore = playerA.ore + 1;
                        elseif playerBGive == 2
                            playerA.lumber = playerA.lumber + 1;
                        elseif playerBGive == 3
                            playerA.grain = playerA.grain + 1;
                        elseif playerBGive == 4
                            playerA.wool = playerA.wool + 1;
                        elseif playerBGive == 5
                            playerA.brick = playerA.brick + 1;
                        end
                        % take away from playerA
                        if playerBGet == 1
                            playerA.ore = playerA.ore - 1;
                        elseif playerBGet == 2
                            playerA.lumber = playerA.lumber - 1;
                        elseif playerBGet == 3
                            playerA.grain = playerA.grain - 1;
                        elseif playerBGet == 4
                            playerA.wool = playerA.wool - 1;
                        elseif playerBGet == 5
                            playerA.brick = playerA.brick - 1;
                        end
                    end
                    playerStruct(playerBN) = playerB;
                end
            end
            
            %% choose second player to trade with
            % second player
            if hasTraded == false     % if still haven't traded with a player
                chosen = false;
                while chosen == false
                    playerCN = randi(4);    % chose other player
                    if playerCN ~= playerN && playerCN ~= playerBN
                        chosen = true;
                    end
                end
                playerC = playerStruct(playerCN);
                %% player who was asked analyzes
                for iAsk = 1:5  % for 5 resources
                    if tradeA{iAsk} == true && hasTraded == false && iAsk ~= outcomeN
                        playerCGet = iAsk;
                        playerCGive = outcomeN;
                        playerCTest = playerC;
                        playerCPreTrade = playerWorth(playerC);
                        
                        % add the resource
                        if playerCGet == 1
                            playerCTest.ore = playerCTest.ore + 1;
                        elseif playerCGet == 2
                            playerCTest.lumber = playerCTest.lumber + 1;
                        elseif playerCGet == 3
                            playerCTest.grain = playerCTest.grain + 1;
                        elseif playerCGet == 4
                            playerCTest.wool = playerCTest.wool + 1;
                        elseif playerCGet == 5
                            playerCTest.brick = playerCTest.brick + 1;
                        end
                        
                        % take away the resource
                        if playerCGive == 1
                            playerCTest.ore = playerCTest.ore - 1;
                        elseif playerCGive == 2
                            playerCTest.lumber = playerCTest.lumber - 1;
                        elseif playerCGive == 3
                            playerCTest.grain = playerCTest.grain - 1;
                        elseif playerCGive == 4
                            playerCTest.wool = playerCTest.wool - 1;
                        elseif playerCGive == 5
                            playerCTest.brick = playerCTest.brick - 1;
                        end
                        % re-evaluate worth
                        playerCPostTrade = playerWorth(playerCTest);
                        
                        % does playerB have enough cards?
                        playerCTrade = false;
                        if playerCGive == 1
                            if playerC.ore > 0
                                playerCTrade = true;
                            end
                        elseif playerCGive == 2
                            if playerC.lumber > 0
                                playerCTrade = true;
                            end
                        elseif playerCGive == 3
                            if playerC.grain > 0
                                playerCTrade = true;
                            end
                        elseif playerCGive == 4
                            if playerC.wool > 0
                                playerCTrade = true;
                            end
                        elseif playerCGive == 5
                            if playerC.brick > 0
                                playerCTrade = true;
                            end
                        end
                        
                        % is the trade worth it?
                        if playerCPostTrade > playerCPreTrade && playerCTrade == true
                            hasTraded = true;
                            playerA.usedTrade = playerA.usedTrade + 1;
                            % add the resource
                            if playerCGet == 1
                                playerC.ore = playerC.ore + 1;
                            elseif playerCGet == 2
                                playerC.lumber = playerC.lumber + 1;
                            elseif playerCGet == 3
                                playerC.grain = playerC.grain + 1;
                            elseif playerCGet == 4
                                playerC.wool = playerC.wool + 1;
                            elseif playerCGet == 5
                                playerC.brick = playerC.brick + 1;
                            end
                            % take away the resource
                            if playerCGive == 1
                                playerC.ore = playerC.ore - 1;
                            elseif playerCGive == 2
                                playerC.lumber = playerC.lumber - 1;
                            elseif playerCGive == 3
                                playerC.grain = playerC.grain - 1;
                            elseif playerCGive == 4
                                playerC.wool = playerC.wool - 1;
                            elseif playerCGive == 5
                                playerC.brick = playerC.brick - 1;
                            end
                            % add to  playerA
                            if playerCGive == 1
                                playerA.ore = playerA.ore + 1;
                            elseif playerCGive == 2
                                playerA.lumber = playerA.lumber + 1;
                            elseif playerCGive == 3
                                playerA.grain = playerA.grain + 1;
                            elseif playerCGive == 4
                                playerA.wool = playerA.wool + 1;
                            elseif playerCGive == 5
                                playerA.brick = playerA.brick + 1;
                            end
                            % take away from playerA
                            if playerCGet == 1
                                playerA.ore = playerA.ore - 1;
                            elseif playerCGet == 2
                                playerA.lumber = playerA.lumber - 1;
                            elseif playerCGet == 3
                                playerA.grain = playerA.grain - 1;
                            elseif playerCGet == 4
                                playerA.wool = playerA.wool - 1;
                            elseif playerCGet == 5
                                playerA.brick = playerA.brick - 1;
                            end
                        end
                        playerStruct(playerCN) = playerC;
                    end
                end
            end
        end
    end
end
    
    playerStruct(playerN) = playerA;

