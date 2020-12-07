function [point, tile, playerStruct] = assignPlayers(point, tile, playerStruct)
% inputs:   point
%           tile
%           playerStruct - 'player'
% outputs:  point
%           tile
%           playerStruct - 'player'

%% player 1
playerN = 1;    % player we are working with
pointN = 10;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;
end

pointN = 45;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end

%% player 2
playerN = 2;    % player we are working with
pointN = 22;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end

pointN = 34;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end

%% player 3
playerN = 3;    % player we are working with
pointN = 15;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end

pointN = 25;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end

%% player 4
playerN = 4;    % player we are working with
pointN = 41;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end

pointN = 52;
point(pointN).occupation = playerN;           % assign occupation to the point
tilesLength = length(point(pointN).tile);   % find how many tiles are around the point
tiles = point(pointN).tile;          % store all tiles
for ix = 1:tilesLength          % for each tile
    letter = tiles(ix);         
    number = indexof(letter);   % add one settlement to the total settlements
    tile(number).player(playerN).settlements = tile(number).player(playerN).settlements + 1;
    player(playerN).stash.settlement = player(playerN).stash.settlement - 1;

end