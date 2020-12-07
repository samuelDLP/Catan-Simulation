function tileNumber = indexof(tileString)
% finds the number of the letter of the tile

letterArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S'];

for it = 1:19
    if strcmp(letterArray(it), tileString)
        tileNumber = it;
    end
end
