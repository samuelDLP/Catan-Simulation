% test.m
% This is the program that our catan simulation will run to create
% presentable data
% Group 3, Travis Chiu, April 24
% TRAVIS add 'valid' as a variable for games < 1000 turns. then run
% simulations and collect data
clc; % clear command window


%% Load player struct
load('playerStruct.mat');

%% Input variables for testing
numOfGames = 5; %Changing this will change the ammount of games simulated

player(1).variable.maxSettlements = 3; %This is the number of settlements p1 will build before looking to build a city
player(1).variable.resourceRank{1} = 'grain'; %Set these two to either: ore, lumber, grain, wool brick
player(1).variable.resourceRank{2} = 'ore';
player(1).variable.port = 1; % Boolean to see if computer will go for ports, 0 for false 1 for true
player(1).variable.devCardRate = 0.05; %rate at which player will go for development cards set between 0-1

player(2).variable.maxSettlements = 3;
player(2).variable.resourceRank{1} = 'lumber';
player(2).variable.resourceRank{2} = 'ore';
player(2).variable.port = 1; 
player(2).variable.devCardRate = 0.05;

player(3).variable.maxSettlements = 3;
player(3).variable.resourceRank{1} = 'lumber';
player(3).variable.resourceRank{2} = 'ore';
player(3).variable.port = 1; 
player(3).variable.devCardRate = 0.05;

player(4).variable.maxSettlements = 3;
player(4).variable.resourceRank{1} = 'lumber';
player(4).variable.resourceRank{2} = 'ore';
player(4).variable.port = 1; 
player(4).variable.devCardRate = 0.05;

% save('playerStruct.mat', 'player');
%% Setup win counter and total vp counter
wins = [0,0,0,0]; % [p1wins, p2wins, p3wins, p4wins]
totalVP = [0,0,0,0]; %[p1VP, p2VP, p3VP, p4VP]
totalRoads = [0,0,0,0]; %[p1R, p2R, p3R, p4R]
totalSettlements = [0,0,0,0]; %[p1S, p2S, p3S, p4S]
totalCities = [0,0,0,0]; %[p1C, p2C, p3C, p4C]
totalDevPoints = [0,0,0,0]; %[p1D, p2D, p3D, p4D]

%% Run game 
for ix = 1:numOfGames
    [finalPlayer] = mainProgram(player);
    disp(['Game ', num2str(ix)]);
    %% Calculate who won this game
    for iPlayer = 1:4
        if finalPlayer(iPlayer).vp.total == 10
            wins(1,iPlayer) = wins(1,iPlayer) + 1;
        end
    end
    %% Calculate average VP
    for xPlayer = 1:4
        totalVP(1,xPlayer) = totalVP(1,xPlayer) + finalPlayer(xPlayer).vp.total;
    end
     %% Calculate average roads places
    for xPlayer = 1:4
        totalRoads(1,xPlayer) = totalRoads(1,xPlayer) + finalPlayer(xPlayer).stats.road;
    end
    %% Calculate average settlements
    for xPlayer = 1:4
        totalSettlements(1,xPlayer) = totalSettlements(1,xPlayer) + finalPlayer(xPlayer).stats.settlement;
    end
    %% Calcualte average cities
    for xPlayer = 1:4
        totalCities(1,xPlayer) = totalCities(1,xPlayer) + finalPlayer(xPlayer).stats.city;
    end
    %% Calculate average points from dev cards
    for xPlayer = 1:4
        totalDevPoints(1,xPlayer) = totalDevPoints(1,xPlayer) + finalPlayer(xPlayer).devCard.vp;
    end
end
    
%% Calculate average VP for each player
pOneAvgVP = totalVP(1,1)/numOfGames;
pTwoAvgVP = totalVP(1,2)/numOfGames;
pThreeAvgVP = totalVP(1,3)/numOfGames;
pFourAvgVP = totalVP(1,4)/numOfGames;

%% Calculate average roads
pOneAvgR = totalRoads(1,1)/numOfGames;
pTwoAvgR = totalRoads(1,2)/numOfGames;
pThreeAvgR = totalRoads(1,3)/numOfGames;
pFourAvgR = totalRoads(1,4)/numOfGames;

%% Calculate average settlements
pOneAvgS = totalSettlements(1,1)/numOfGames;
pTwoAvgS = totalSettlements(1,2)/numOfGames;
pThreeAvgS = totalSettlements(1,3)/numOfGames;
pFourAvgS = totalSettlements(1,4)/numOfGames;

%% Calculate average cities
pOneAvgC = totalCities(1,1)/numOfGames;
pTwoAvgC = totalCities(1,2)/numOfGames;
pThreeAvgC = totalCities(1,3)/numOfGames;
pFourAvgC = totalCities(1,4)/numOfGames;

%% Calculate average VP from Dev Cards
pOneAvgD = totalDevPoints(1,1)/numOfGames;
pTwoAvgD = totalDevPoints(1,2)/numOfGames;
pThreeAvgD = totalDevPoints(1,3)/numOfGames;
pFourAvgD = totalDevPoints(1,4)/numOfGames;

%% Display Results
disp('Using the following variables: ');
disp('Player | Max settlements | Resource 1 | Resource 2 | Port Boolean | Dev Card Rate');
disp(['P1:            ',num2str(player(1).variable.maxSettlements),'              ',player(1).variable.resourceRank{1},'         ',player(1).variable.resourceRank{2},'           ',num2str(player(1).variable.port),'             ',num2str(player(1).variable.devCardRate)]);
disp(['P2:            ',num2str(player(2).variable.maxSettlements),'             ',player(2).variable.resourceRank{1},'         ',player(2).variable.resourceRank{2},'           ',num2str(player(2).variable.port),'             ',num2str(player(2).variable.devCardRate)]);
disp(['P3:            ',num2str(player(3).variable.maxSettlements),'             ',player(3).variable.resourceRank{1},'         ',player(3).variable.resourceRank{2},'           ',num2str(player(3).variable.port),'             ',num2str(player(3).variable.devCardRate)]);
disp(['P4:            ',num2str(player(4).variable.maxSettlements),'             ',player(4).variable.resourceRank{1},'         ',player(4).variable.resourceRank{2},'           ',num2str(player(4).variable.port),'             ',num2str(player(4).variable.devCardRate)]);
disp(' ');
disp(['After ',num2str(numOfGames),' games, here are the results: ']);
disp('Total wins: ');
disp(['P1: ',num2str(wins(1,1))]);
disp(['P2: ',num2str(wins(1,2))]);
disp(['P3: ',num2str(wins(1,3))]);
disp(['P4: ',num2str(wins(1,4))]);
disp(' ');
disp('Average Victory Points: ');
disp(['P1: ',num2str(pOneAvgVP)]);
disp(['P2: ',num2str(pTwoAvgVP)]);
disp(['P3: ',num2str(pThreeAvgVP)]);
disp(['P4: ',num2str(pFourAvgVP)]);
disp(' ');
disp('Average Roads: ');
disp(['P1: ',num2str(pOneAvgR)]);
disp(['P2: ',num2str(pTwoAvgR)]);
disp(['P3: ',num2str(pThreeAvgR)]);
disp(['P4: ',num2str(pFourAvgR)]);
disp(' ');
disp('Average Settlements: ');
disp(['P1: ',num2str(pOneAvgC)]);
disp(['P2: ',num2str(pTwoAvgC)]);
disp(['P3: ',num2str(pThreeAvgC)]);
disp(['P4: ',num2str(pFourAvgC)]);
disp(' ');
disp('Average Cities: ');
disp(['P1: ',num2str(pOneAvgS)]);
disp(['P2: ',num2str(pTwoAvgS)]);
disp(['P3: ',num2str(pThreeAvgS)]);
disp(['P4: ',num2str(pFourAvgS)]);
disp(' ');
disp('Average Victory Points from Development Cards: ');
disp(['P1: ',num2str(pOneAvgD)]);
disp(['P2: ',num2str(pTwoAvgD)]);
disp(['P3: ',num2str(pThreeAvgD)]);
disp(['P4: ',num2str(pFourAvgD)]);
disp(' ');