function [player, tile] = knight(playerNum, player , tile, roll, point)
% This is the knight function for catan
% Group 3, Travis Chiu, April 23

%% Check if player has a knight development card
num = playerNum; % Just a shorthand to access the player and dev card struct
check = 0; %On off switch to check if they player has enough resources
if player(num).devCard.knight <= 1
    check = 1;
end

%% Part of the robber function
if check == 1
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
    while robbed == false || check > 20      %% make sure check all cards, once found will skip loop.
        robbedCard = randi(5);

        if robbedCard == 1  % check ore
            if player(robbedPlayer).ore > 0
                player(robbedPlayer).ore = player(robbedPlayer).ore - 1;
                player(playerN).ore = player(playerN).ore + 1;
                robbed = true;
            end
            check = check + 1;
        elseif robbedCard == 2 % check lumber
            if player(robbedPlayer).lumber > 0
                player(robbedPlayer).lumber = player(robbedPlayer).lumber - 1;
                player(playerN).lumber = player(playerN).lumber + 1;
                robbed = true;
            end
            check = check + 1;
        elseif robbedCard == 3  % check grain
            if player(robbedPlayer).grain > 0
                player(robbedPlayer).grain = player(robbedPlayer).grain - 1;
                player(playerN).grain = player(playerN).grain + 1;
                robbed = true;
            end
            check = check + 1;
        elseif robbedCard == 4  % check wool
            if player(robbedPlayer).wool > 0
                player(robbedPlayer).wool = player(robbedPlayer).wool - 1;
                player(playerN).wool = player(playerN).wool + 1;
                robbed = true;
            end
            check = check + 1;
        elseif robbedCard == 5  % check brick
            if player(robbedPlayer).brick > 0
                player(robbedPlayer).brick = player(robbedPlayer).brick - 1;
                player(playerN).brick = player(playerN).brick + 1;
                robbed = true;
            end
            check = check + 1;
        end
    end
    
    %% Give the player a knight in the counter and take away a knight
    player(num).vp.largestArmy = player(num).vp.largestArmy + 1;
    player(num).devCard.knight = player(num).devCard.knight - 1;
else
    player = player;
end