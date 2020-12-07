function [boolean] = ifSettlement(playerN, pointN, point, map)
% checks a point and determines whether (1) or not (0) a settlement can be
% placed there due to the rule stating settlements must be more than one
% road apart from each other
% input:    playerN - NUMBER of the player
%           pointN - number of the point of interest
% output:   boolean - 1 (yes you CAN build a settlement!)
%                     0 (no you CANNOT build a settlement!)
% e.g. [ifBuild] = ifSettlement(2, 45) and ifBuild = 1, player 2 CAN build
% a settlement at point 45

%% pt2. Check for all settlements
%load('point.mat');
pointArray = point(pointN).connection;
point1 = pointArray(1);
point2 = pointArray(2);
point3 = pointArray(3);
boolean = true; % assume you are able to build (until proven otherwise)
% check point1 and point2
if point(point1).occupation ~=0 || point(point2).occupation ~=0 || point(pointN).occupation ~= 0
    boolean = false;        % changes if occupied by any player
end

% check point3
if point3 ~= 0
    if point(point3).occupation ~= 0
        boolean = false;    % changes if occupied by any player and point3
    end                     % exists
end


%% pt1.Check player's roads
% at least 1 road must be from the player.

if boolean == true      % if still possible to build a settlement
    boolean = false;    % return to false to check the roads around it
    %load('map.mat');
    if map{pointN, point1} == playerN   % checks to see if player is connected to a road
        boolean = true;
    elseif map{pointN, point2} == playerN
        boolean = true;
    elseif point3 ~= 0
        if map{pointN, point3} == playerN
            boolean = true;
        end
    end                     
end