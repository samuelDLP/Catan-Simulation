function [player, deck] = assignResources(player, rollNumber, deck, roll, tile)
% this function assigns resources when a number is rolled
% player is the entire structure!

rollSpots(1) = roll{rollNumber, 1};         % first tile for roll
rollSpots(2) = roll{rollNumber, 2};    % second tile for roll

for iSpot = 1:2
    if rollSpots(iSpot) ~= 0                % if second tile isn't 0 do both
        tileNumber = rollSpots(iSpot);      % find tile number
        tileResource = tile(tileNumber).resource;   % find resource of tile number
        for iPlayer = 1:4               % go throuh all 4 players
            if strcmp(tileResource, 'ore')     % if the resource is ore
                differenceS = tile(tileNumber).player(iPlayer).settlements * 1; % find number of resources to distribute
                differenceC = tile(tileNumber).player(iPlayer).cities * 2;
                if deck.ore - differenceS - differenceC >= 0
                    player(iPlayer).ore = player(iPlayer).ore + differenceS + differenceC;        % add to player stash
                    deck.ore = deck.ore - differenceS - differenceC;                              % take away from deck
                end
            elseif strcmp(tileResource, 'lumber')
                differenceS = tile(tileNumber).player(iPlayer).settlements * 1; % find number of resources to distribute
                differenceC = tile(tileNumber).player(iPlayer).cities * 2;
                if deck.lumber - differenceS - differenceC >= 0
                    player(iPlayer).lumber = player(iPlayer).lumber + differenceS + differenceC;        % add to player stash
                    deck.lumber = deck.lumber - differenceS - differenceC;                              % take away from deck
                end
            elseif strcmp(tileResource, 'grain')
                differenceS = tile(tileNumber).player(iPlayer).settlements * 1; % find number of resources to distribute
                differenceC = tile(tileNumber).player(iPlayer).cities * 2;
                if deck.grain - differenceS - differenceC >= 0
                    player(iPlayer).grain = player(iPlayer).grain + differenceS + differenceC;        % add to player stash
                    deck.grain = deck.grain - differenceS - differenceC;                              % take away from deck
                end
            elseif strcmp(tileResource, 'wool')
                differenceS = tile(tileNumber).player(iPlayer).settlements * 1; % find number of resources to distribute
                differenceC = tile(tileNumber).player(iPlayer).cities * 2;
                if deck.wool - differenceS - differenceC >= 0
                    player(iPlayer).wool = player(iPlayer).wool + differenceS + differenceC;        % add to player stash
                    deck.wool = deck.wool - differenceS - differenceC;                              % take away from deck
                end
            elseif strcmp(tileResource, 'brick')
                differenceS = tile(tileNumber).player(iPlayer).settlements * 1; % find number of resources to distribute
                differenceC = tile(tileNumber).player(iPlayer).cities * 2;
                if deck.brick - differenceS - differenceC >=0
                    player(iPlayer).brick = player(iPlayer).brick + differenceS + differenceC;        % add to player stash
                    deck.brick = deck.brick - differenceS - differenceC;                              % take away from deck
                end
            end
        end
    end
end