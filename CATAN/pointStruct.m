% pointStruct.m
% the array/struct of the catan board map

% Author: Leai maarkowsi
% Date: 7 Apr, 2019

clc;

%% map cell array

point(1).connection = [2, 9, 0];  % connected points, if only connected ot 2 points, add a 0 at the end
point(1).tile = ['A'];            % tile letter
point(1).occupation = 0;          % 0-4, 0 = unoccupied, 1-4  = which player
point(1).port = 1;               %0-9, 0= no port,1-9 indicates which port 

point(2).connection = [1, 3, 0];
point(2).tile = ['A']; 
point(2).occupation = 0;
point(2).port = 1;  

point(3).connection = [2, 4, 11];
point(3).tile = ['A', 'B']; 
point(3).occupation = 0;
point(3).port = 0;  

point(4).connection = [3, 5, 0];
point(4).tile = ['B']; 
point(4).occupation = 0;
point(4).port = 2;  

point(5).connection = [4, 6, 13];
point(5).tile = ['B', 'C']; 
point(5).occupation = 0;
point(5).port = 2;  

point(6).connection = [5, 7, 0];
point(6).tile = ['C']; 
point(6).occupation = 0;
point(6).port = 0;  

point(7).connection = [6, 15, 0];
point(7).tile = ['C']; 
point(7).occupation = 0;
point(7).port = 0;

point(8).connection = [9, 18, 0];
point(8).tile = ['D']; 
point(8).occupation = 0;
point(8).port = 9;

point(9).connection = [1, 8, 10];
point(9).tile = ['A', 'D']; 
point(9).occupation = 0;
point(9).port = 0;

point(10).connection = [9, 11, 20];
point(10).tile = ['A', 'D', 'E']; 
point(10).occupation = 0;
point(10).port = 0;

point(11).connection = [3, 10, 12];
point(11).tile = ['A','B', 'E']; 
point(11).occupation = 0;
point(11).port = 0;

point(12).connection = [11, 13, 22];
point(12).tile = ['B', 'E', 'F']; 
point(12).occupation = 0;
point(12).port = 0;

point(13).connection = [5, 12, 14];
point(13).tile = ['B', 'C', 'F']; 
point(13).occupation = 0;
point(13).port = 0;

point(14).connection = [13, 15, 24];
point(14).tile = ['C', 'F', 'G']; 
point(14).occupation = 0;
point(14).port = 0;

point(15).connection = [7, 14, 16];
point(15).tile = ['C', 'G']; 
point(15).occupation = 0;
point(15).port = 3;

point(16).connection = [15, 26, 0];
point(16).tile = ['G']; 
point(16).occupation = 0;
point(16).port = 3;

point(17).connection = [18, 28, 0];
point(17).tile = ['H']; 
point(17).occupation = 0;
point(17).port = 0;

point(18).connection = [8, 17, 19];
point(18).tile = ['D', 'H']; 
point(18).occupation = 0;
point(18).port = 9;

point(19).connection = [18, 20, 30];
point(19).tile = ['D', 'H', 'I']; 
point(19).occupation = 0;
point(19).port = 0;

point(20).connection = [10, 19, 21];
point(20).tile = ['D', 'E', 'I']; 
point(20).occupation = 0;
point(20).port = 0;

point(21).connection = [20, 22, 32];
point(21).tile = ['E', 'I', 'J']; 
point(21).occupation = 0;
point(21).port = 0;

point(22).connection = [12, 21, 23];
point(22).tile = ['E', 'F', 'J']; 
point(22).occupation = 0;
point(22).port = 0;

point(23).connection = [22, 24, 34];
point(23).tile = ['F', 'J', 'K']; 
point(23).occupation = 0;
point(23).port = 0;

point(24).connection = [14, 23, 25];
point(24).tile = ['F', 'G', 'K']; 
point(24).occupation = 0;
point(24).port = 0;

point(25).connection = [24, 26, 36];
point(25).tile = ['G', 'K', 'L']; 
point(25).occupation = 0;
point(25).port = 0;

point(26).connection = [16, 25, 27];
point(26).tile = ['G', 'L']; 
point(26).occupation = 0;
point(26).port = 0;

point(27).connection = [26, 38, 0];
point(27).tile = ['L']; 
point(27).occupation = 0;
point(27).port = 4;

point(28).connection = [17, 29, 0];
point(28).tile = ['H']; 
point(28).occupation = 0;
point(28).port = 0;

point(29).connection = [28, 30, 39];
point(29).tile = ['H', 'M']; 
point(29).occupation = 0;
point(29).port = 8;

point(30).connection = [19, 29, 31];
point(30).tile = ['H', 'I', 'M']; 
point(30).occupation = 0;
point(30).port = 0;

point(31).connection = [30, 32, 41];
point(31).tile = ['I', 'M', 'N']; 
point(31).occupation = 0;
point(31).port = 0;

point(32).connection = [21, 31, 33];
point(32).tile = ['I', 'J', 'N']; 
point(32).occupation = 0;
point(32).port = 0;

point(33).connection = [32, 34, 43];
point(33).tile = ['J', 'N', 'O']; 
point(33).occupation = 0;
point(33).port = 0;

point(34).connection = [23, 33, 35];
point(34).tile = ['J', 'K', 'O']; 
point(34).occupation = 0;
point(34).port = 0;

point(35).connection = [34, 36, 45];
point(35).tile = ['K', 'O', 'P']; 
point(35).occupation = 0;
point(35).port = 0;

point(36).connection = [25, 35, 37];
point(36).tile = ['K', 'L','P']; 
point(36).occupation = 0;
point(36).port = 0;

point(37).connection = [36, 38, 47];
point(37).tile = ['L', 'P']; 
point(37).occupation = 0;
point(37).port = 0;

point(38).connection = [27, 37, 0];
point(38).tile = ['L', 'P']; 
point(38).occupation = 0;
point(38).port = 4;

point(39).connection = [29, 40, 0];
point(39).tile = ['M']; 
point(39).occupation = 0;
point(39).port = 8;

point(40).connection = [39, 41, 48];
point(40).tile = ['M', 'Q']; 
point(40).occupation = 0;
point(40).port = 0;

point(41).connection = [31, 40, 42];
point(41).tile = ['M', 'N', 'Q']; 
point(41).occupation = 0;
point(41).port = 0;

point(42).connection = [41, 43, 50];
point(42).tile = ['N', 'Q', 'R']; 
point(42).occupation = 0;
point(42).port = 0;

point(43).connection = [33, 42, 44];
point(43).tile = ['N', 'O', 'R']; 
point(43).occupation = 0;
point(43).port = 0;

point(44).connection = [43, 45, 52];
point(44).tile = ['O', 'R', 'S']; 
point(44).occupation = 0;
point(44).port = 0;

point(45).connection = [35, 44, 46];
point(45).tile = ['O', 'P', 'S']; 
point(45).occupation = 0;
point(45).port = 0;

point(46).connection = [45, 54, 0];
point(46).tile = ['P', 'S']; 
point(46).occupation = 0;
point(46).port = 5;

point(47).connection = [37, 46, 0];
point(47).tile = ['P']; 
point(47).occupation = 0;
point(47).port = 5;

point(48).connection = [40, 49, 0];
point(48).tile = ['Q']; 
point(48).occupation = 0;
point(48).port = 7;

point(49).connection = [48, 50, 0];
point(49).tile = ['Q']; 
point(49).occupation = 0;
point(49).port = 7;

point(50).connection = [42, 49, 51];
point(50).tile = ['Q', 'R']; 
point(50).occupation = 0;
point(50).port = 0;

point(51).connection = [50, 52, 0];
point(51).tile = ['R']; 
point(51).occupation = 0;
point(51).port = 6;

point(52).connection = [44, 51, 53];
point(52).tile = ['R', 'S']; 
point(52).occupation = 0;
point(52).port = 6;

point(53).connection = [52, 54, 0];
point(53).tile = ['S']; 
point(53).occupation = 0;
point(53).port = 0;

point(54).connection = [46, 53, 0];
point(54).tile = ['S']; 
point(54).occupation = 0;
point(54).port = 0;

for it = 1:54                           % start off the distance of each point
    point(it).distance.ore = 15;        % 15 away from any given resource
    point(it).distance.lumber = 15;
    point(it).distance.grain = 15;
    point(it).distance.wool = 15;
    point(it).distance.brick = 15;
    point(it).distance.port = 15;
end

save('point', 'point');