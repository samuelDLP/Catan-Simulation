% rollAndTile.m
% create cell array/struct for each roll number and each tile
%   Author: Samuel De La Paz
%   Date: 4/7/19

% EDITED: Leabin Markowski
% date: 15 April 2019, hard coded the resources

%% roll cell array
% roll{1, 1} = 0;
% roll{1, 2} = 0;
% for ir = 2:12
%     roll{ir, 1} = '';   % first tile letter "1" is on
%     roll{ir, 2} = '';   % second tile "1" is on
% end


%% tile 

% for ix = 1:19
%     tile(ix).robber = 0;        % the robber is not located on this tile
%     for ip = 1:4
%         tile(ix).player(ip).settlements = 0;    % no settlements or cities placed by
%         tile(ix).player(ip).cities = 0;         % any teams
%     end
% end

% Points surrounding a tile
tile(1).points = [1, 2, 3, 9, 10, 11]; % A
tile(2).points = [3, 4, 5, 11, 12, 13]; % B
tile(3).points = [5, 6, 7, 13, 14, 15]; % C
tile(4).points = [8, 9, 10, 18, 19, 20]; % D
tile(5).points = [10, 11, 12, 20, 21, 22]; % E
tile(6).points = [12, 13, 14, 22, 23, 24]; % F
tile(7).points = [14, 15, 16, 24, 25, 26]; % G
tile(8).points = [17, 18, 19, 28, 29, 30]; % H
tile(9).points = [19, 20, 21, 30, 31, 32]; % I
tile(10).points = [21, 22, 23, 32, 33, 34]; % J
tile(11).points = [23, 24, 25, 34, 35, 36]; % K
tile(12).points = [25, 26, 27, 36, 37, 38]; % L
tile(13).points = [29, 30, 31, 39, 40, 41]; % M
tile(14).points = [31, 32, 33, 41, 42, 43]; % N
tile(15).points = [33, 34, 35, 43, 44, 45]; % O
tile(16).points = [35, 36, 37, 45, 46, 47]; % P
tile(17).points = [40, 41, 42, 48, 49, 50]; % Q
tile(18).points = [42, 43, 44, 50, 51, 52]; % R
tile(19).points = [44, 45, 46, 52, 53, 54]; % S

%% resource assingment

tile(1).resource = 'lumber';
tile(2).resource = 'wool';
tile(3).resource = 'grain';
tile(4).resource = 'brick';
tile(5).resource = 'ore';
tile(6).resource = 'brick';
tile(7).resource = 'wool';
tile(8).resource = 'desert';
tile(9).resource = 'lumber';
tile(10).resource = 'grain';
tile(11).resource = 'lumber';
tile(12).resource = 'grain';
tile(13).resource = 'brick';
tile(14).resource = 'wool';
tile(15).resource = 'wool';
tile(16).resource = 'ore';
tile(17).resource = 'ore';
tile(18).resource = 'grain';
tile(19).resource = 'lumber';

%%

% add roll number to the structure?
tile(1).roll = 0;
save('rollAndTile', 'roll', 'tile');