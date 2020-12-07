function [player, tile, pointCity] = cityPlacement(player, tile, point, pointCity)
% check all possible settlements, replace one
% input:    player - player(#)
%           rest are variables

placeCity = false;
hasPlaced = false;
for iPoint = 1:54
    if point(iPoint).occupation == player.number && pointCity(iPoint) == 0
        placeCity = true;
    end
    if placeCity == true && hasPlaced == false
            pointCity(iPoint) = player.number;       % add occupation to point
            player.stash.city = player.stash.city - 1;   % subtract from stash
            player.stash.settlement = player.stash.settlement + 1; % add to stash for settlement
            tileLength = length(point(iPoint).tile);        % add to tiles
            tileLetters = point(iPoint).tile;
            for ix = 1:tileLength
                tileN = indexof(tileLetters(ix));
                tile(tileN).player(player.number).cities = tile(tileN).player(player.number).cities + 1;
            end
            hasPlaced = true;
        end
end
