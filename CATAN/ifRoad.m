function [boolean] = ifRoad(playerN, point1, point2, point, map)
% checks an edge and determines whether (1) or not (0) a road can be
% placed. It must be connected to another road or settlement
% jk it doesn't matter if it's connected to a settlement, after inital
% placement it will be connected to a road no matter what
% input:    playerN - NUMBER of the player
%           pointN - number of the point of interest
% output:   boolean - 1 (yes you CAN build a road!)
%                     0 (no you CANNOT build a road!)
% e.g. [ifBuild] = ifRoad(2, 45, 52) and ifBuild = 1, player 2 CAN build
% a road between points 45 and 52

%% check if road space is occupied
%load('map.mat')
%load('point.mat')
boolean = false;
if map{point1, point2} == 0 % if the road space is unoccupied
    %% check if road will be connected to another road
    point1Array = point(point1).connection; % check point1
    for ix = 1:3        % check three connection points
        if point1Array(ix) ~= point2 && point1Array(ix)~= 0
            if map{point1, point1Array(ix)} == playerN  % if the road is connected to
                boolean = true;                         % other road from same player
            end
        end
    end
    % check point2
    point2Array = point(point2).connection;
    for ix = 1:3        % check three connection points
        if point2Array(ix) ~= point1 && point2Array(ix)~= 0
            if map{point2, point2Array(ix)} == playerN
                boolean = true;
            end
        end
    end
end