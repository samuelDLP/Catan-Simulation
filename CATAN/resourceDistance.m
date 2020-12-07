% resourceDistance.m

% calculate distance of each point from each resource at each tile 
%   Author: Samuel De La Paz
%   Date: 4/10/19
% 



for itileNumber = 1:19
    
    pointsAroundTile = tile(itileNumber).points;   % array of points around current tile
    % resource of current tile
    resource = tile(itileNumber).resource;
    
    %% if tile is ore
    if strcmp(resource, 'ore')
        % assign all points around tile a value of 0 for ORE
        for iCorner = 1:6
            pointIndex = pointsAroundTile(iCorner);
            point(pointIndex).distance.ore = 0;
        end
        change = 1;
        while change == 1
            change = 0;
            for iPoint = 1:54
                connectingPoints = point(iPoint).connection;
                for iConnecting = 1:3
                    pointCheck = connectingPoints(iConnecting);
                    if pointCheck ~= 0
                        currentValue = point(iPoint).distance.ore;
                        neighborValue = point(pointCheck).distance.ore;
                        if neighborValue > currentValue + 1
                            point(pointCheck).distance.ore = currentValue + 1;
                            change = 1;
                        end
                    end
                end
            end
        end
        
        %% if tile is lumber
    elseif strcmp(resource, 'lumber')
        % assign all points around tile a value of 0 for LUMBER
        for iCorner = 1:6
            pointIndex = pointsAroundTile(iCorner);
            point(pointIndex).distance.lumber = 0;
        end
        change = 1;
        while change == 1
            change = 0;
            for iPoint = 1:54
                connectingPoints = point(iPoint).connection;
                for iConnecting = 1:3
                    pointCheck = connectingPoints(iConnecting);
                    if pointCheck ~= 0
                        currentValue = point(iPoint).distance.lumber;
                        neighborValue = point(pointCheck).distance.lumber;
                        if neighborValue > currentValue + 1
                            point(pointCheck).distance.lumber = currentValue + 1;
                            change = 1;
                        end
                    end
                end
            end
        end
        
        
        %% if tile is wool
    elseif strcmp(resource, 'wool')
        % assign all points around tile a value of 0 for WOOL
        for iCorner = 1:6
            pointIndex = pointsAroundTile(iCorner);
            point(pointIndex).distance.wool = 0;
        end
        change = 1;
        while change == 1
            change = 0;
            for iPoint = 1:54
                connectingPoints = point(iPoint).connection;
                for iConnecting = 1:3
                    pointCheck = connectingPoints(iConnecting);
                    if pointCheck ~= 0
                        currentValue = point(iPoint).distance.wool;
                        neighborValue = point(pointCheck).distance.wool;
                        if neighborValue > currentValue + 1
                            point(pointCheck).distance.wool = currentValue + 1;
                            change = 1;
                        end
                    end
                end
            end
        end
        
        
        %% if tile is grain
    elseif strcmp(resource, 'grain')
        % assign all points around tile a value of 0 for GRAIN
        for iCorner = 1:6
            pointIndex = pointsAroundTile(iCorner);
            point(pointIndex).distance.grain = 0;
        end
        change = 1;
        while change == 1
            change = 0;
            for iPoint = 1:54
                connectingPoints = point(iPoint).connection;
                for iConnecting = 1:3
                    pointCheck = connectingPoints(iConnecting);
                    if pointCheck ~= 0
                        currentValue = point(iPoint).distance.grain;
                        neighborValue = point(pointCheck).distance.grain;
                        if neighborValue > currentValue + 1
                            point(pointCheck).distance.grain = currentValue + 1;
                            change = 1;
                        end
                    end
                end
            end
        end
        
        
        %% if tile is brick
    elseif strcmp(resource, 'brick')
        % assign all points around tile a value of 0 for BRICK
        for iCorner = 1:6
            pointIndex = pointsAroundTile(iCorner);
            point(pointIndex).distance.brick = 0;
        end
        change = 1;
        while change == 1
            change = 0;
            for iPoint = 1:54
                connectingPoints = point(iPoint).connection;
                for iConnecting = 1:3
                    pointCheck = connectingPoints(iConnecting);
                    if pointCheck ~= 0
                        currentValue = point(iPoint).distance.brick;
                        neighborValue = point(pointCheck).distance.brick;
                        if neighborValue > currentValue + 1
                            point(pointCheck).distance.brick = currentValue + 1;
                            change = 1;
                        end
                    end
                end
            end
        end
    end
end

for iPort = 1:9
    pointsAroundPort = port(iPort).points;   % array of points connected to port
    % assign all points around port a value of 0 for PORT
        for iCorner = 1:2
            pointIndex = pointsAroundPort(iCorner);
            point(pointIndex).distance.port = 0;
        end
        change = 1;
        while change == 1
            change = 0;
            for iPoint = 1:54
                connectingPoints = point(iPoint).connection;
                for iConnecting = 1:3
                    pointCheck = connectingPoints(iConnecting);
                    if pointCheck ~= 0
                        currentValue = point(iPoint).distance.port;
                        neighborValue = point(pointCheck).distance.port;
                        if neighborValue > currentValue + 1
                            point(pointCheck).distance.port = currentValue + 1;
                            change = 1;
                        end
                    end
                end
            end
        end
end
