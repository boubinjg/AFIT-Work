%Reads the dataset from 'filePath' into the variable 'data'
filePath = 'database.csv';
data = csvread(filePath);

%current row in the dataset
curRow = 1;

outfile = zeros(3,6);


%2 = off screen
%3 = planet
%7 = off screen
for partNum = 1 : 48
   for game = 1 : 16
        while curRow <= size(data,1) && data(curRow,2) == game
            %if(reliabilityPerm(partNum, game) ~= 0)
                col = 0;
                switch reliabilityPerm(partNum, game)
                    case 1
                        col = 1;
                    case 0.95
                        col = 2;
                    case 0.9
                        col = 3;
                    case 0.8
                        col = 4;
                    case 0.7
                        col = 5;
                    case 0
                        col = 6;
                end
                if data(curRow, 5) == 2
                    outfile(1, col) = outfile(1, col) + 1;
                elseif data(curRow, 5) == 3
                    outfile(2, col) = outfile(2, col) + 1;    
                elseif data(curRow, 5) == 7
                    outfile(3, col) = outfile(3, col) + 1;
                end
            %end
            curRow = curRow + 1;
        end
   end
end
