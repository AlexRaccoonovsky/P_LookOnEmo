function FilteredSample=FilteringCompTable(CompTableAppend,IncludeParam)
% function for dedication sample from CompTableAppend witn using IncludeParam

%% Stage 1. Filtering data by Date Interval
 % Initialization array of valid rows
 ArrayOfValidNumRows=[];
 % Extracting Start & Finish Points of Date Interval & modification to
 % DateTimeFormat
 % Extract quantity interval from StartDateArray
 QuantIntervals = size(IncludeParam{2,1}.StartDate) 
 % Extract Date Intervals Arrays
 StartPointArray = IncludeParam{2,1}.StartDate;
 FinishPointArray = IncludeParam{2,1}.FinishDate;
 % Modification to DateTimeFormat & extraction valid rows to sample
    for CurrentIntervalDate=1:1:QuantIntervals(1,2)
        % Choose double limits from array
        StartPointCurrent = StartPointArray(CurrentIntervalDate);
        FinishPointCurrent = FinishPointArray(CurrentIntervalDate);
        % Convert to string format
        StartPointCurrentStr = num2str(StartPointCurrent);
        FinishPointCurrentStr = num2str(FinishPointCurrent);
        % Convert to datetime format
        StartPointDTF = datetime(StartPointCurrentStr,'InputFormat','yyyyMMdd');
        FinishPointDTF = datetime(FinishPointCurrentStr,'InputFormat','yyyyMMdd');
        % Find # valid rows of CompTableAppend in CurrentIntervalDate
        ValidNumRows = find(CompTableAppend.Date>=StartPointDTF & CompTableAppend.Date<=FinishPointDTF)
        ArrayOfValidNumRows = [ArrayOfValidNumRows; ValidNumRows]
    end
 
 StageOneSample= CompTableAppend(ArrayOfValidNumRows,:)
 FilteredSample = StageOneSample;