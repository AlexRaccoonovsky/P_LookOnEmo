function FilteredSample=FilteringCompTable(CompTableAppend,IncludeParam)
% function for dedication sample from CompTableAppend witn using IncludeParam

%% Stage 1. Filtering data by Date Interval
StageOneFilteredSample = FilteringStageOne(CompTableAppend,IncludeParam);
%% Stage 2. Filtering result data of previous stage by Month Day
StageTwoFilteredSample = FilteringStageTwo(StageOneFilteredSample,IncludeParam);

FilteredSample = StageTwoFilteredSample;
 
% Subfunction of Stage One 
 function StageOneFilteredSample=FilteringStageOne(CompTableAppend,IncludeParam)
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
     % Filtering sample after stage one
     StageOneFilteredSample= CompTableAppend(ArrayOfValidNumRows,:)
     
% Subfunction of Stage Two
function StageTwoFilteredSample = FilteringStageTwo(StageOneFilteredSample,IncludeParam)
    % Extract Month Day from StageOneFilteredSample
    MonthDayArray=day(StageOneFilteredSample.Date)
    % Extract valid Month Days from IncludeParam
    ValidMonthDays=IncludeParam{3,1};
    ValidNumRows = find(MonthDayArray == ValidMonthDays)
    StageTwoFilteredSample = ValidNumRows
     