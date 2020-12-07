% devCardSetup.m

% Creates the intial structure of development cards that will be the pile drawn from throughout the game

% Group 3, Travis Chiu, April 10



%% Create the struct

devCard(1).knight = 14;

devCard(1).vp = 5;

devCard(1).roadBuilding = 2;

devCard(1).monopoly = 2;

devCard(1).yearsOfPlenty = 2;



%% Save

save('devCard.mat', 'devCard');