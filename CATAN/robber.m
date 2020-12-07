function [tile, playerStruct, deck] = robber(playerStruct, playerN, tile, roll, point, deck)
% when a 7 is rolled, this function is called to move to a tile where there
% are lots of opponents, and then steals a resource from one of the
% opponents on the tile.
% input:    playerStruct - structure for all players 'player'
%           playerN - number of player who rolled the 7
%           tile - tile structure, to see who is on tiles and move robber
%           point - structure of all points, to see who is on the tiles
%           deck - 'deck'
% outputs:  tile
%           playerStruct - 'player'
%           deck - 'deck'


%% take away half of everyone's cards over 7
for iPlayer = 1:4
    tempPlayer = playerStruct(iPlayer);
    playerSum = tempPlayer.ore + tempPlayer.lumber + tempPlayer.grain + tempPlayer.wool + tempPlayer.brick;
    if playerSum > 7
        % subract until reaches half (rounded up)
        halfDec = playerSum / 2;
        half = floor(halfDec);       % round down - how many to take away
        iCard = 0;
        while iCard <= half
            cardGuess = randi(5);
            if cardGuess == 1  % check ore
                if playerStruct(iPlayer).ore > 0
                    playerStruct(iPlayer).ore = playerStruct(iPlayer).ore - 1;
                    deck.ore = deck.ore + 1;
                    iCard = iCard + 1;
                end
            elseif cardGuess == 2 % check lumber
                if playerStruct(iPlayer).lumber > 0
                    playerStruct(iPlayer).lumber = playerStruct(iPlayer).lumber - 1;
                    deck.lumber = deck.lumber + 1;
                    iCard = iCard + 1;
                end
            elseif cardGuess == 3  % check grain
                if playerStruct(iPlayer).grain > 0
                    playerStruct(iPlayer).grain = playerStruct(iPlayer).grain - 1;
                    deck.grain = deck.grain + 1;
                    iCard = iCard + 1;
                end
            elseif cardGuess == 4  % check wool
                if playerStruct(iPlayer).wool > 0
                    playerStruct(iPlayer).wool = playerStruct(iPlayer).wool - 1;
                    deck.wool = deck.wool + 1;
                    iCard = iCard + 1;
                end
            elseif cardGuess == 5  % check brick
                if playerStruct(iPlayer).brick > 0
                    playerStruct(iPlayer).brick = playerStruct(iPlayer).brick - 1;
                    deck.brick = deck.brick + 1;
                    iCard = iCard + 1;
                end
            end
        end
    end
end
%% move the robber
% locate the robber
for iTile = 1:19
    if tile(iTile).robber == 1
        robberTile = iTile;
    end
end
% remove robber from current spot
tile(robberTile).robber = 0;

% figure out where to move the robber
% roll numbers 4 - 10 ( the more likely ones)

roll4(1) = roll{4, 1};
roll4(2) = roll{4, 2};
roll5(1) = roll{5, 1};
roll5(2) = roll{5, 2};
roll6(1) = roll{6, 1};
roll6(2) = roll{6, 2};
roll8(1) = roll{8, 1};
roll8(2) = roll{8, 2};
roll9(1) = roll{9, 1};
roll9(2) = roll{9, 2};
roll10(1) = roll{10, 1};
roll10(2) = roll{10, 2};
tileArray = [roll4; roll5; roll6; roll8; roll9; roll10];
tileOccupation = zeros(6, 2);

% depending on how tiles are stored in 'roll', use index of or straight
% values
% (assuming indexof)
for ix = 1:6
    for iy = 1:2
        tileNumber = tileArray(ix, iy);    % uses number to find tile number
        tilePoints = tile(tileNumber).points;       % array of points around tile
        
        for x = 1:6                            % go around tile to see how many people on it
            iPoint = tilePoints(x);
            if point(iPoint).occupation > 0 && point(iPoint).occupation ~= playerN
                tileOccupation(ix, iy) = tileOccupation(ix, iy) + 1;
            end
        end
    end
end

% find max occupation around a tile
maxOccupation = [1, 1];
for ix = 1:6
    for iy = 1:2
        if tileOccupation(ix, iy) > maxOccupation
            maxOccupation = [ix, iy];
        end
    end
end

% place the robber around max tile
maxX = maxOccupation(1);
maxY = maxOccupation(2);
maxTile = tileArray(maxX, maxY);    % number of tile
tile(maxTile).robber = 1;

% robber has been moved!

%% steal a card
% check occupation around tile (maxTile)
tilePoints = tile(maxTile).points;       % array of points around tile
stolen = false;
while stolen == false
    iPoint = randi(6);                          % go around tile to randomly chose one
    test = tilePoints(iPoint);
    if point(test).occupation > 0 && point(test).occupation ~= playerN % choose this player
        robbedPlayer = point(test).occupation;
        stolen = true;
    end
end
% steal the card
robbed = false;
check = 0;
while robbed == false && check < 20      %% make sure check all cards, once found will skip loop.
    robbedCard = randi(5);
    
    if robbedCard == 1  % check ore
        if playerStruct(robbedPlayer).ore > 0
            playerStruct(robbedPlayer).ore = playerStruct(robbedPlayer).ore - 1;
            playerStruct(playerN).ore = playerStruct(playerN).ore + 1;
            robbed = true;
        end
        check = check + 1;
    elseif robbedCard == 2 % check lumber
        if playerStruct(robbedPlayer).lumber > 0
            playerStruct(robbedPlayer).lumber = playerStruct(robbedPlayer).lumber - 1;
            playerStruct(playerN).lumber = playerStruct(playerN).lumber + 1;
            robbed = true;
        end
        check = check + 1;
    elseif robbedCard == 3  % check grain
        if playerStruct(robbedPlayer).grain > 0
            playerStruct(robbedPlayer).grain = playerStruct(robbedPlayer).grain - 1;
            playerStruct(playerN).grain = playerStruct(playerN).grain + 1;
            robbed = true;
        end
        check = check + 1;
    elseif robbedCard == 4  % check wool
        if playerStruct(robbedPlayer).wool > 0
            playerStruct(robbedPlayer).wool = playerStruct(robbedPlayer).wool - 1;
            playerStruct(playerN).wool = playerStruct(playerN).wool + 1;
            robbed = true;
        end
        check = check + 1;
    elseif robbedCard == 5  % check brick
        if playerStruct(robbedPlayer).brick > 0
            playerStruct(robbedPlayer).brick = playerStruct(robbedPlayer).brick - 1;
            playerStruct(playerN).brick = playerStruct(playerN).brick + 1;
            robbed = true;
        end
        check = check + 1;
    end
end
% if player has no cards, tough luck!

