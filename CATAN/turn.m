function [player, tile, roll, point, deck, map, devCard, pointCity]=turn(player, playerN, tile, roll, point, deck, map, devCard, pointCity)
% inputs: tile- "tile"
% roll- what tiles are being accessed based on currentRoll
% player- player
% outputs: tile- "tile"
% roll-
% player-

player(playerN).tradeAbility = true;
player(playerN).devCardAbility = true;
player(playerN).buyAbility = true;
[player(playerN)] = playerPriorityChange(player(playerN), point, map);

%% start turn by calling rollDice.m function
currentRoll = rollDice;


% if dice sum is 7: use robber function
if currentRoll == 7
    [tile, player, deck] = robber(player, playerN, tile, roll, point, deck);
    
    % if dice sum is not 7: produce resource of all the tile associated with
    % the # rolled to the players who have a settlement/city on that tile
else
    [player, deck] = assignResources(player, currentRoll, deck, roll, tile);
    
end



%% trade, build, or buy development card
endTurnCount = 0;
endTurn = false;
while endTurn == false
    [action, outcome, outcome2] = playerDecision(player(playerN));
    % if buy
    if strcmp(action, 'buy')
        if strcmp(outcome, 'road')
            [player(playerN), tile, map] = roadPlacement(player(playerN), tile, point, map);
            % add used resource cards to deck
            deck.brick = deck.brick + 1;
            deck.lumber = deck.lumber + 1;
            % take away from playerHand
            player(playerN).brick = player(playerN).brick - 1;
            player(playerN).lumber = player(playerN).lumber - 1;
        end
        if strcmp(outcome, 'settlement')
            [player(playerN), tile, point] = settlementPlacement(player(playerN), tile, point, map);
            % add used resource cards to deck
            deck.brick = deck.brick + 1;
            deck.lumber = deck.lumber + 1;
            deck.grain = deck.grain + 1;
            deck.wool = deck.wool + 1;
            % take away from playerHand
            player(playerN).brick = player(playerN).brick - 1;
            player(playerN).lumber = player(playerN).lumber - 1;
            player(playerN).grain = player(playerN).grain - 1;
            player(playerN).wool = player(playerN).wool - 1;
        end
        if strcmp(outcome, 'city')
            % city placement
            [player(playerN), tile, pointCity] = cityPlacement(player(playerN), tile, point, pointCity);
            % add used resource cards to deck
            deck.ore = deck.ore + 3;
            deck.grain = deck.grain + 2;
            % take away from playerHand
            player(playerN).ore = player(playerN).ore - 3;
            player(playerN).grain = player(playerN).grain - 2;
        end
        if strcmp(outcome, 'devCard')
            [player(playerN), devCard] = buyDevCard(player(playerN), devCard);
            % add used resource cards to deck
            deck.grain = deck.grain + 1;
            deck.wool = deck.wool + 1;
            deck.ore = deck.ore + 1;
            % take away from playerHand
            player(playerN).grain = player(playerN).grain - 1;
            player(playerN).wool = player(playerN).wool - 1;
            player(playerN).ore = player(playerN).ore - 1;
        end
    elseif strcmp(action,'trade') % trade
        [player, deck] = playerTrade(player, playerN, outcome, outcome2, deck, point);
    elseif strcmp(action, 'play devCard')
        switch outcome
            case 'knight'
                [player, tile] = knight(playerNum, player , tile, roll, point);
            case 'roadbuilding'
                [player, tile, map] = roadbuilding(playerNum, player , tile, point, map);
            case 'monopoly'
                [player] = monopoly(playerNum, player);
            case 'yearOfPlenty'
                [player, deck] = yearOfPlenty(playerNum, player, deck);
        end
    elseif strcmp(action, 'end turn')
        endTurn = true;
    end
    endTurnCount = endTurnCount + 1;
    if endTurnCount >= 3
        endTurn = true;
    end
    
end
[player(playerN)] = playerPriorityChange(player(playerN), point, map);


