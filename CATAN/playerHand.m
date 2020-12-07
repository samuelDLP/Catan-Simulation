function [cardHand] = playerHand(player)
% inputs:   player - player(1) for player 1
%           ** SPECIFY WHICH NUMBER PLAYER
% outputs:  cardHand - array of cards in the following order
%           [ore, lumber, grain, wool, brick]

cardHand = [player.ore, player.lumber, player.grain, player.wool, player.brick];