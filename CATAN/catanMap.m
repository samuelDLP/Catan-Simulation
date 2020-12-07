% catanMap.m
% cell array of the game map. 
%   Author: Samuel De La Paz
%   Date: 4/7/19

%% map cell array
for ix = 1:54
    map{ix, ix} = point(ix);
end

%% roads

for ip = 1:54   % checks all 54 points
    for ic = 1:3    % checks all three connections
        edge = point(ip).connection(ic);    % check location of edges at each point
        if edge ~= 0                        % if connected to a point
            map{ip, edge} = 0;              % who occupies the edge, 1-4, 0 means not occupied
            %map{edge, ip} = 0;
            map{edge, ip} = map{ip, edge};    % cover both sides of the array
        end
    end
end

%save('catanMap', 'map')