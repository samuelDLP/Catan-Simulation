function [player] = playerPriorityChange(player, point, map)
% look at the player stash and the player variable to determine how to
% change priority of buying certain items. 
% Run at the beginning (for turn decisions) and end of
% every turn (for trade decisions)
% inputs:   player - player(1) for player 1
%           ** SPECIFY WHICH NUMBER PLAYER
% outputs:  player - player(1) for player 1
%           ** SPECIFY WHICH NUMBER PLAYER

%load('point.mat');
%load('map.mat');
%% update city priority
% use variable player.variable.maxSettlements
% if the maximum settlements have been placed, and after that
maxSettlementReached = false;   % intitialize boolean variable
if player.stats.settlement + player.stats.city >= player.variable.maxSettlements    % if maxSettlement reached
    maxSettlementReached = true;
end

% if it has been reached, set city priority to 4 and settlement priority to
% 3. if it hasn't, city priority will be kept at 0. if the player is out of
% cities, it will reset to 0.
if maxSettlementReached == true    % as one city is added and settlement taken away, still update to city
    player.priority.city = 4;               % make city priority higher than
    player.priority.settlement = 3;         % settlement priority
end
% if player ran out of cities
if player.stash.city == 0
    player.priority.city = 0;
end
                
%% update settlement priority
% check if it's possible to place a settlement
% if it's NOT POSSIBLE lower the priority of a settlement first!
% create array of all possible settlement spots for player
playerN = player.number;    % records the number of the player
settlementAvailability = false;     % assume player can't build settlement until proven otherwise
% if player N can place a settlement on at least one spot on the whole
% board, then settlementBuild is true
settlementBuild = false;        % initialize
for iPoint = 1:54
    settlementAvailability = ifSettlement(playerN, iPoint, point, map);
    if settlementAvailability == true
        settlementBuild = true;             % if one of the points are available for build, continue
    end
end
if settlementBuild == true                      % if there IS a spot to build a settlement, investigate further!!
    if player.stats.road > 4*(player.stats.city + player.stats.settlement)  % if there are more roads than 2*buildings
        if maxSettlementReached == false
            player.priority.settlement = 4; % go for a settlement (if maxSettlement not reached)
        end
        player.priority.road = 3.5;           % change road no matter what (second to settlement if maxSettlement not reached,
                                              % second to city if maxSettlement is reached)
        % once all settlements are filled by cities
        if player.stats.city >= player.variable.maxSettlements  % once reached maxSettlements with cities
            player.priority.city = 3;
            player.priority.settlement = 4;
        end
    else                                      % second to city if maxSettlement is reached)
        player.priority.settlement = 2;
        player.priority.road = 4.5;       % it's important to get roads if there are less roads than twice
                                        % the amount of settlements/cities.
    end
    % check if ran out of settlements
    if player.stash.settlement == 0
        player.priority.city = 4;
        player.priority.settlement = 0;
    end
    
else
    player.priority.settlement = 0;     % if player cannot build a settlement, assign a 0!!
    if maxSettlementReached  == true  % if maxSettlement reached
        player.priority.road = 3.5;     % road priority above settlement priority but below city priority
    end
end



%% update road priority
% it is already updated from the previous code. however we must check to
% see if it is possible to place a road at all
roadAvailable = false;      % assume no road is available
for iCol = 1:54
    for iRow = 1:54
        if iCol > iRow      % if not a point and only checks upper right of map (no double counts)
            point1 = iRow;
            point2 = iCol;
            if map{point1, point2} == playerN       % if the road space is occupied by the player
                %% check if there is an open edge connected
                point1Array = point(point1).connection; % check point1 connections
                for ix = 1:3        % check three connection points
                    if point1Array(ix) ~= point2 && point1Array(ix)~= 0 % if not checking point2 or not 0
                        if map{point1, point1Array(ix)} == 0  % if adjacent road unoccupied
                            roadAvailable = true;                         
                        end
                    end
                end
                % check point2
                point2Array = point(point2).connection;
                for ix = 1:3        % check three connection points
                    if point2Array(ix) ~= point1 && point2Array(ix)~= 0
                        if map{point2, point2Array(ix)} == 0
                            roadAvailable = true;
                        end
                    end
                end
            end
            
        end
    end
end

% if roadAvailable == false
%     player.priority.road = 0;   % if it's impossible to place a road, player will never want to buy a road.
% end

% if player ran out of roads
if player.stash.road == 0
    player.priority.road = 0;
end
%% update devCard priority
player.priority.devCard = player.priority.devCard + player.variable.devCardRate;

