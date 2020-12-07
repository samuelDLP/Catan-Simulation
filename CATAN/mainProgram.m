function [player] = mainProgram(player)
% mainProgram.m

% main body of the prgram, takes all the functions and puts them together!
% also displays some stats at the end, like how many settlements, cities,
% and Victory Points each player had at the end of the game

% Author: Leabin Markowski
% Date: 23 April 2019

%% set up board and player

load('deck');
load('devCard');
load('map');
load('market');
%load('playerStruct');
load('point');
load('port');
load('rollAndTile');
load('pointCity');



%% game loop

% initalize game variables
VP = false;
count = 1;
tile(8).robber = 1;     % add robber

% allocate initial resources
for rolli = 2:12
    [player, deck] = assignResources(player, rolli, deck, roll, tile);
end

player(1).stash.road = 13;
player(2).stash.road = 13;
player(3).stash.road = 13;
player(4).stash.road = 13;
player(1).stash.settlement = 3;
player(2).stash.settlement = 3;
player(3).stash.settlement = 3;
player(4).stash.settlement = 3;



player(1).usedPort = 0;
player(2).usedPort = 0;
player(3).usedPort = 0;
player(4).usedPort = 0;

player(1).usedTrade = 0;
player(2).usedTrade = 0;
player(3).usedTrade = 0;
player(4).usedTrade = 0;

player(1).buyAbility = true;
player(2).buyAbility = true;
player(3).buyAbility = true;
player(4).buyAbility = true;



turns = 0;
while VP == false
    turns = turns + 1;
    % only function I need is paige's turn function
    
    [player, tile, roll, point, deck, map, devCard, pointCity] = turn(player, count, tile, roll, point, deck, map, devCard, pointCity);
    
    
    % determines the number of roads, settlements, and cities each player has
    % by subtracting how many of each buildable object is left minus the hard
    % coded max they starte with
    player(count).stats.road = 15 - player(count).stash.road;
    player(count).stats.settlement = 5 - player(count).stash.settlement;
    player(count).stats.city = 4 - player(count).stash.city;
    
    % determines the VP worth of settlements and cities
    cityVP = player(count).stats.city * 2;  % cities are worth 2 VP each
    settlementVP = player(count).stats.settlement;
    
    % adds up how many VP each player has at the end of their turn after one cycle
    player(count).vp.total = cityVP + settlementVP;
    
    % devCards
    if player(count).vp.largestArmy >= 5 && player(count).vp.largestArmy >= player(1).vp.largestArmy && ...
            player(count).vp.largestArmy >= player(2).vp.largestArmy && ...
            player(count).vp.largestArmy >= player(3).vp.largestArmy && ...
            player(count).vp.largestArmy >= player(4).vp.largestArmy
        player(1).vp.longestRoad = 0;
        player(2).vp.longestRoad = 0;
        player(3).vp.longestRoad = 0;
        player(4).vp.longestRoad = 0;
        player(count).vp.longestRoad = 1;
    end
    player(count).vp.total = player(count).vp.total + player(count).vp.longestRoad;
    player(count).vp.total = player(count).vp.total + player(count).devCard.vp;
    % decides if the loop continues by looking at if a player has 10 or more VP
    if player(count).vp.total >= 10
        VP = true;
    else
        VP = false;
    end
    
    % have a counter that runs from 1 to 4, each time the loop reaches 4
    % it restarts the loop to run again until someone reaches 10 VP
    if count == 4
        count = 1;
    else
        count = count + 1;
    end
end

% after each loop, display the stats in an array
hello = 1;
%% display game stats

% displays all four player's number of settlements, cities, and total VP

% disp('Player 1 has: ');
% disp(['  ',num2str(player(1).stats.settlement) ,' settlements']);
% disp(['  ',num2str(player(1).stats.city) ,' cities']);
% disp(['  ',num2str(player(1).vp.total) ,' total Victory Points']);
% 
% disp('Player 2 has: ');
% disp(['  ',num2str(player(2).stats.settlement) ,' settlements']);
% disp(['  ',num2str(player(2).stats.city) ,' cities']);
% disp(['  ',num2str(player(2).vp.total) ,' total Victory Points']);
% 
% disp('Player 3 has: ');
% disp(['  ',num2str(player(3).stats.settlement) ,' settlements']);
% disp(['  ',num2str(player(3).stats.city) ,' cities']);
% disp(['  ',num2str(player(3).vp.total) ,' total Victory Points']);
% 
% disp('Player 4 has: ');
% disp(['  ',num2str(player(4).stats.settlement) ,' settlements']);
% disp(['  ',num2str(player(4).stats.city) ,' cities']);
% disp(['  ',num2str(player(4).vp.total) ,' total Victory Points']);
