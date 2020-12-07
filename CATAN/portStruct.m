% portStruct.m
% create a structure with port data

%% assign values to port
% points that connect to port
port(1).points = [1, 2];
port(2).points = [4, 5];
port(3).points = [15, 16];
port(4).points = [27, 38];
port(5).points = [46, 47];
port(6).points = [51, 52];
port(7).points = [48, 49];
port(8).points = [29, 39];
port(9).points = [8, 18];

% what you trade in
port(1).input{1} = '?';
port(2).input{1} = 'wool';
port(3).input{1} = '?';
port(4).input{1} = '?';
port(5).input{1} = 'brick';
port(6).input{1} = 'lumber';
port(7).input{1} = '?';
port(8).input{1} = 'grain';
port(9).input{1} = 'ore';

% # of cards port takes in
% e.g. port 2 takes in 2 'wool' and outputs 1 of any desired card.
port(1).input{2} = 3;
port(2).input{2} = 2;
port(3).input{2} = 3;
port(4).input{2} = 3;
port(5).input{2} = 2;
port(6).input{2} = 2;
port(7).input{2} = 3;
port(8).input{2} = 2;
port(9).input{2} = 2;

save('port', 'port');