%This Script parses the data from the 
%TestExperiment3_EventsDatabase.csv file
%Written by Jayson Boubin Feb 2nd 2017
%Any questions about this script can be send to
%boubinjg@miamioh.edu


%Reads the dataset from 'filePath' into the variable 'data'
filePath = 'testExperiment3_EventsDatabase.csv';
data = csvread(filePath);

%current row in the dataset
curRow = 1;
%outfile is the matrix which will be written to an Excel file
outfile = zeros(20*18,7);
%loop through every participant

for par = 1 : 20
    %loop through every game
    for game = 1 : 18
        %Initialize outfile rows and row variables
        %row one and two, current participant and game
        outfile((par-1)*18 + game, 1) = par;
        outfile((par-1)*18 + game, 2) = game;
        %total number of human redraws in the game
        Hredraws = 0;
        %set of ships initially drawn by automation
        adSet = java.util.TreeSet;
        %set of ships initially drawn by human
        hdSet = java.util.TreeSet;
        %set of ships initially drawn by automation, then redrawn by human
        AHredrawSet = java.util.TreeSet;
        
        %While we are examining the current game
        while curRow <= size(data,1) && data(curRow,2) == game
            %count the number of auto draws:
            if(data(curRow, 5) == 8)
                adSet.add(data(curRow,4));
            end
            %Handle human draws/redraws
            if(data(curRow,5) == 10)
                shipNum = data(curRow,4);
                %count human draws: neither hdset or adset contains ship#
                if(~(adSet.contains(shipNum) || hdSet.contains(shipNum)))
                    hdSet.add(shipNum);            
                end
                %count redraws: one set contains the ship, meaning it's
                %been drawn before.
                if(adSet.contains(shipNum) || hdSet.contains(shipNum))
                    Hredraws = Hredraws + 1;
                end
                %human-auto: The human redraws an initial automation route
                if(adSet.contains(shipNum) && ~AHredrawSet.contains(shipNum))
                    AHredrawSet.add(shipNum);
                end
            end
            curRow = curRow + 1;
        end
        %print rows to outfile:
        %row 4: initial automation draws
        outfile((par-1) * 18 + game, 4) = adSet.size();
        %row 5: initial human draws
        outfile((par-1) * 18 + game, 5) = hdSet.size();
        %row 6: human redraws
        outfile((par-1) * 18 + game, 6) = Hredraws;
        %row 7: auto routes redrawn by the human:
        outfile((par-1) * 18 + game, 7) = AHredrawSet.size();
    end
end
%add a header
header = {'Participant','Game','Spawn Rate','Initial Automation Draws','Initial Human Draws','Human Redraws', 'Auto Routes Redrawn by Human'};
FormattedOutFile = mat2dataset(outfile,'VarNames',header);
%export to excel file
export(FormattedOutFile,'XLSFile','SNEx3_Draw_Information.xlsx');
%export to csv
csvwrite('SNEx3_Draw_Information.csv',outfile);
%save to Matlab file
save('SNEx3_Draw_Information','outfile');