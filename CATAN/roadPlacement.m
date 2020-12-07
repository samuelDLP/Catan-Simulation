function [player, tile, map] = roadPlacement(player, tile, point, map)
% places a road hopefully towards a desireable resource
% input:    player - player(#)
%           rest are variables

resource1 = player.variable.resourceRank(1); % string for first priority resource
resource2 = player.variable.resourceRank(1); % string for second priority resource
placeRoad = false;
for iPoint = 1:54
    if placeRoad == false
        connectedPoints = point(iPoint).connection;
        for ip = 1:3
            if connectedPoints(ip) ~=0
                if iPoint > connectedPoints(ip)
                    point1 = connectedPoints(ip);
                    point2 = iPoint;
                elseif iPoint < connectedPoints(ip)
                    point1 = iPoint;
                    point2 = connectedPoints(ip);
                end
                [boolean] = ifRoad(player.number, point1, point2, point, map);
                % check point 1 for favorability
                if boolean == true
                    if player.variable.port == 1 && point(point1).distance.port == 0
                        placeRoad = true;
                    elseif strcmp(resource1, 'ore') || strcmp(resource2, 'ore')
                        if point(point1).distance.ore == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'lumber') || strcmp(resource2, 'lumber')
                        if point(point1).distance.lumber == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'grain') || strcmp(resource2, 'grain')
                        if point(point1).distance.grain == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'wool') || strcmp(resource2, 'wool')
                        if point(point1).distance.wool == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'brick') || strcmp(resource2, 'brick')
                        if point(point1).distance.brick == 0
                            placeRoad = true;
                        end
                    end
                    % check point 2 for favorability
                    if player.variable.port == 1 && point(point2).distance.port == 0
                        placeRoad = true;
                    elseif strcmp(resource1, 'ore') || strcmp(resource2, 'ore')
                        if point(point2).distance.ore == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'lumber') || strcmp(resource2, 'lumber')
                        if point(point2).distance.lumber == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'grain') || strcmp(resource2, 'grain')
                        if point(point2).distance.grain == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'wool') || strcmp(resource2, 'wool')
                        if point(point2).distance.wool == 0
                            placeRoad = true;
                        end
                    elseif strcmp(resource1, 'brick') || strcmp(resource2, 'brick')
                        if point(point2).distance.brick == 0
                            placeRoad = true;
                        end
                    end
                end
                
                if placeRoad == true
                    % place the road!
                    map{point1, point2} = player.number;
                    player.stash.road = player.stash.road - 1;
                    
                end
            end
        end
    end
end
if placeRoad == false
    for iPoint = 1:54
        if placeRoad == false
            connectedPoints = point(iPoint).connection;
            for ip = 1:3
                if connectedPoints(ip) ~=0
                    if iPoint > connectedPoints(ip)
                        point1 = connectedPoints(ip);
                        point2 = iPoint;
                    elseif iPoint < connectedPoints(ip)
                        point1 = iPoint;
                        point2 = connectedPoints(ip);
                    end
                    [boolean] = ifRoad(player.number, point1, point2, point, map);
                    % check point 1 for favorability
                    if boolean == true
                        if placeRoad == true
                            % place the road!
                            map{point1, point2} = player.number;
                            player(player.number).stash.road = player(player.number).stash.road - 1;
                        end
                    end
                end
            end
        end
    end
    
end