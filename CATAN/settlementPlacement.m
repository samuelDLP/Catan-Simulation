function [player, tile, point] = settlementPlacement(player, tile, point, map)
% places a settlement down after buying one
% input:    player - player(#)
%           rest are variables
resource1 = player.variable.resourceRank{1}; % string for first priority resource
resource2 = player.variable.resourceRank{2}; % string for second priority resource
placeSettlement = false;
for iPoint = 1:54
    [boolean] = ifSettlement(player.number, iPoint, point, map);
    if boolean && placeSettlement == false
        if player.variable.port == 1 && point(iPoint).distance.port == 0
            placeSettlement = true;
        elseif strcmp(resource1, 'ore')
            if point(iPoint).distance.ore == 0
                placeSettlement = true;
            end
        elseif strcmp(resource1, 'lumber')
            if point(iPoint).distance.lumber == 0
                placeSettlement = true;
            end
        elseif strcmp(resource1, 'grain')
            if point(iPoint).distance.grain == 0
                placeSettlement = true;
            end
        elseif strcmp(resource1, 'wool')
            if point(iPoint).distance.wool == 0
                placeSettlement = true;
            end
        elseif strcmp(resource1, 'brick')
            if point(iPoint).distance.brick == 0
                placeSettlement = true;
            end
        end
        
        if placeSettlement == true
            point(iPoint).occupation = player.number;       % add occupation to point
            player.stash.settlement = player.stash.settlement - 1;   % subtract from stash
            tileLength = length(point(iPoint).tile);        % add to tiles
            tileLetters = point(iPoint).tile;
            for ix = 1:tileLength
                tileN = indexof(tileLetters(ix));
                tile(tileN).player(player.number).settlements = tile(tileN).player(player.number).settlements + 1;
            end
        end
        if placeSettlement == false
            if strcmp(resource2, 'ore')
                if point(iPoint).distance.ore == 0
                    placeSettlement = true;
                end
            elseif strcmp(resource2, 'lumber')
                if point(iPoint).distance.lumber == 0
                    placeSettlement = true;
                end
            elseif strcmp(resource2, 'grain')
                if point(iPoint).distance.grain == 0
                    placeSettlement = true;
                end
            elseif strcmp(resource2, 'wool')
                if point(iPoint).distance.wool == 0
                    placeSettlement = true;
                end
            elseif strcmp(resource2, 'brick')
                if point(iPoint).distance.brick == 0
                    placeSettlement = true;
                end
            end
            if placeSettlement == true
                point(iPoint).occupation = player.number;       % add occupation to point
                player.stash.settlement = player.stash.settlement - 1;   % subtract from stash
                tileLength = length(point(iPoint).tile);        % add to tiles
                tileLetters = point(iPoint).tile;
                for ix = 1:tileLength
                    tileN = indexof(tileLetters(ix));
                    tile(tileN).player(player.number).settlements = tile(tileN).player(player.number).settlements + 1;
                end
            end
        end
        
    end
end

% if not at desireable point, chose a random point
if placeSettlement == false
    for iPoint = 1:54
        [boolean] = ifSettlement(player.number, iPoint, point, map);
        if boolean && placeSettlement == false
            point(iPoint).occupation = player.number;       % add occupation to point
            player.stash.settlement = player.stash.settlement - 1;   % subtract from stash
            tileLength = length(point(iPoint).tile);        % add to tiles
            tileLetters = point(iPoint).tile;
            for ix = 1:tileLength
                tileN = indexof(tileLetters(ix));
                tile(tileN).player(player.number).settlements = tile(tileN).player(player.number).settlements + 1;
            end
        end
    end
end
