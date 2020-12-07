% playerStruct.m
% Building the playerStruct that will be placed into main portion of our
% catan simulation
% Travis Chiu, April 7

%% Player Struct
player(1).ore = 0;
player(1).lumber = 0;
player(1).grain = 0;
player(1).wool = 0;
player(1).brick = 0;
player(1).devCard.knight = 0;
player(1).devCard.vp = 0;
player(1).devCard.roadbuilding = 0;
player(1).devCard.monopoly = 0;
player(1).devCard.yearOfPlenty = 0;
player(1).stats.road = 0;
player(1).stats.settlement = 0;
player(1).stats.city = 0;
player(1).stats.hand = 0;
player(1).vp.settlement = 0;
player(1).vp.city = 0;
player(1).vp.devCard = 0;
player(1).vp.longestRoad = 0;            
player(1).vp.largestArmy = 0;            
player(1).vp.total = 0;

player(2).ore = 0;
player(2).lumber = 0;
player(2).grain = 0;
player(2).wool = 0;
player(2).brick = 0;
player(2).devCard.knight = 0;
player(2).devCard.vp = 0;
player(2).devCard.roadbuilding = 0;
player(2).devCard.monopoly = 0;
player(2).devCard.yearOfPlenty = 0;
player(2).stats.road = 0;
player(2).stats.settlement = 0;
player(2).stats.city = 0;
player(2).stats.hand = 0;
player(2).vp.settlement = 0;
player(2).vp.city = 0;
player(2).vp.devCard = 0;
player(2).vp.longestRoad = 0;
player(2).vp.largestArmy = 0;
player(2).vp.total = 0;

player(3).ore = 0;
player(3).lumber = 0;
player(3).grain = 0;
player(3).wool = 0;
player(3).brick = 0;
player(3).devCard.knight = 0;
player(3).devCard.vp = 0;
player(3).devCard.roadbuilding = 0;
player(3).devCard.monopoly = 0;
player(3).devCard.yearOfPlenty = 0;
player(3).stats.road = 0;
player(3).stats.settlement = 0;
player(3).stats.city = 0;
player(3).stats.hand = 0;
player(3).vp.settlement = 0;
player(3).vp.city = 0;
player(3).vp.devCard = 0;
player(3).vp.longestRoad = 0;
player(3).vp.largestArmy = 0;
player(3).vp.total = 0;

player(4).ore = 0;
player(4).lumber = 0;
player(4).grain = 0;
player(4).wool = 0;
player(4).brick = 0;
player(4).devCard.knight = 0;
player(4).devCard.vp = 0;
player(4).devCard.roadbuilding = 0;
player(4).devCard.monopoly = 0;
player(4).devCard.yearOfPlenty = 0;
player(4).stats.road = 0;
player(4).stats.settlement = 0;
player(4).stats.city = 0;
player(4).stats.hand = 0;
player(4).vp.settlement = 0;
player(4).vp.city = 0;
player(4).vp.devCard = 0;
player(4).vp.longestRoad = 0;
player(4).vp.largestArmy = 0;
player(4).vp.total = 0;

%% priority for buying
player(1).priority.road = 5;
player(1).priority.settlement = 0;
player(1).priority.city = 0;
player(1).priority.devCard = 0;

player(2).priority.road = 5;
player(2).priority.settlement = 0;
player(2).priority.city = 0;
player(2).priority.devCard = 0;

player(3).priority.road = 5;
player(3).priority.settlement = 0;
player(3).priority.city = 0;
player(3).priority.devCard = 0;

player(4).priority.road = 5;
player(4).priority.settlement = 0;
player(4).priority.city = 0;
player(4).priority.devCard = 0;

%% variables
player(1).variable.maxSettlements = 5; % # of settlments before trade for city
player(1).variable.resourceRank{1} = 'lumber'; % 1st goal resource
player(1).variable.resourceRank{2} = 'wood'; % 2nd goal resource
player(1).variable.port = false; % go for a port? (boolean)
player(1).variable.devCardRate = .2; % how fast to buy devCards

player(2).variable.maxSettlements = 5; % # of settlments before trade for city
player(2).variable.resourceRank{1} = 'lumber'; % 1st goal resource
player(2).variable.resourceRank{2} = 'wood'; % 2nd goal resource
player(2).variable.port = false; % go for a port? (boolean)
player(2).variable.devCardRate = .2; % how fast to buy devCards

player(3).variable.maxSettlements = 5; % # of settlments before trade for city
player(3).variable.resourceRank{1} = 'lumber'; % 1st goal resource
player(3).variable.resourceRank{2} = 'wood'; % 2nd goal resource
player(3).variable.port = false; % go for a port? (boolean)
player(3).variable.devCardRate = .2; % how fast to buy devCards

player(4).variable.maxSettlements = 5; % # of settlments before trade for city
player(4).variable.resourceRank{1} = 'lumber'; % 1st goal resource
player(4).variable.resourceRank{2} = 'wood'; % 2nd goal resource
player(4).variable.port = false; % go for a port? (boolean)
player(4).variable.devCardRate = .2; % how fast to buy devCards

%% player stash
player(1).stash.road = 15; % initially 15 roads per player
player(1).stash.settlement = 5; % initially 5 settlements per player, 3 after game starts
player(1).stash.city = 4; % initially 4 cities per player

player(2).stash.road = 15; % initially 15 roads per player
player(2).stash.settlement = 5; % initially 5 settlements per player, 3 after game starts
player(2).stash.city = 4; % initially 4 cities per player

player(3).stash.road = 15; % initially 15 roads per player
player(3).stash.settlement = 5; % initially 5 settlements per player, 3 after game starts
player(3).stash.city = 4; % initially 4 cities per player

player(4).stash.road = 15; % initially 15 roads per player
player(4).stash.settlement = 5; % initially 5 settlements per player, 3 after game starts
player(4).stash.city = 4; % initially 4 cities per player

% trade ability - so they only trade 2 times per turn
player(1).tradeAbility = true;
player(2).tradeAbility = true;
player(3).tradeAbility = true;
player(4).tradeAbility = true;

% devCard ability - so they only play 1 card per turn
player(1).devCardAbility = true;
player(2).devCardAbility = true;
player(3).devCardAbility = true;
player(4).devCardAbility = true;

% store player number for if only one structure is placed into a function
player(1).number = 1;
player(2).number = 2;
player(3).number = 3;
player(4).number = 4;
%% Save
save('playerStruct.mat');