function FilteredSample=FilteringCompTable(CompTableAppend,IncludeParam)
% function for dedication sample from CompTableAppend witn using IncludeParam

%% Stage 1. Filtering data by Date Interval
StageOneFilteredSample = FilteringStageOne(CompTableAppend,IncludeParam);
%% Stage 2. Filtering result data of previous stage by Month Day
%StageTwoFilteredSample = FilteringStageTwo(StageOneFilteredSample,IncludeParam);
%% Stage 3. Filtering result data of previous stage by Week Day
%StageThreeFilteredSample = FilteringStageThree(StageTwoFilteredSample,IncludeParam);
%% Stage 4. Filtering result data of previous stage by Time
%StageFourSample = FilteringStageFour(StageThreeFilteredSample,IncludeParam);



FilteredSample = StageOneFilteredSample;
 
% Subfunction of Stage One 
 function StageOneFilteredSample=FilteringStageOne(CompTableAppend,IncludeParam)
     % Initialization array of valid rows
     ArrayOfValidNumRows=[];
     % Extracting Start & Finish Points of Date Interval & modification to
     % DateTimeFormat
     % Extract quantity interval from StartDateArray
     QuantIntervals = size(IncludeParam{2,1}.StartDate);
     % Extract Date Intervals Arrays
     StartPointArray = IncludeParam{2,1}.StartDate;
     FinishPointArray = IncludeParam{2,1}.FinishDate;
     % Modification to DateTimeFormat & extraction valid rows to sample
        for CurrentIntervalDate=1:1:QuantIntervals(1,2)
            % Choose limits (double-format) from array
            StartPointCurrent = StartPointArray(CurrentIntervalDate);
            FinishPointCurrent = FinishPointArray(CurrentIntervalDate);
            % Convert to string format
            StartPointCurrentStr = num2str(StartPointCurrent);
            FinishPointCurrentStr = num2str(FinishPointCurrent);
            % Convert to datetime format
            StartPointDTF = datetime(StartPointCurrentStr,'InputFormat','yyyyMMdd');
            FinishPointDTF = datetime(FinishPointCurrentStr,'InputFormat','yyyyMMdd');
            % Find # valid rows of CompTableAppend in CurrentIntervalDate
            ValidNumRows = find(CompTableAppend.Date>=StartPointDTF &...
                                CompTableAppend.Date<=FinishPointDTF);...
            ArrayOfValidNumRows = [ArrayOfValidNumRows; ValidNumRows]
        end
     % Filtering sample after stage one

     StageOneFilteredSample=ValidNumRows;%CompTableAppend(ArrayOfValidNumRows,:);

     % Subfunction of Stage Two
function StageTwoFilteredSample = FilteringStageTwo(StageOneFilteredSample,IncludeParam)
    % Initialize Array with Valid Rows on stage 2
    ValidNumRows = [];
    % Extract Month Day from StageOneFilteredSample
    MonthDayArray=day(StageOneFilteredSample.Date);
    % Extract valid Month Days from IncludeParam
    ValidMonthDays=IncludeParam{3,1};
    % Quantity of Valid Day
    QuanOfValidDays = size(ValidMonthDays);
    % Finding rows with Valid Days of Month[]
    for CurMonthDay = 1:1:QuanOfValidDays(1,2)
        ValidNumRowsCur = find(MonthDayArray==ValidMonthDays(CurMonthDay)); 
        ValidNumRows = [ValidNumRows;ValidNumRowsCur]
    end
    % Sorting number of rows with valid rows
    ValidNumRows = sort (ValidNumRows);
    % Extract filtered data from data of stage 1
    StageTwoFilteredSample = StageOneFilteredSample(ValidNumRows,:);
    
% Subfunction of Stage Three
function StageThreeFilteredSample = FilteringStageThree(StageTwoFilteredSample,IncludeParam)
     % Initialize Array with Valid Rows on stage 3
     ValidNumRows = [];
     % Extract Week Day from StageTwoFilteredSample
     DayForm='long';
     [WeekDayNumber, WeekDayName]=weekday(StageTwoFilteredSample.Date,DayForm);
     % Extract valid Week Days from IncludeParam
     ValidWeekDays=IncludeParam{4,1};
     % Quantity of Valid week Day
     QuanOfValidDays = size(ValidWeekDays);
     % Finding rows with Valid Days of Month
     for CurWeekDay = 1:1:QuanOfValidDays(1,2)
        ValidNumRowsCur = find(WeekDayNumber==ValidWeekDays(CurWeekDay)); 
        ValidNumRows = [ValidNumRows;ValidNumRowsCur];
     end
     % Sorting number of rows with valid rows
     ValidNumRows = sort (ValidNumRows);
     % Extract filtered data from data of stage 1
     StageThreeFilteredSample = StageTwoFilteredSample(ValidNumRows,:);
     
% Subfunction of stage Four
function StageFourSample = FilteringStageFour(StageThreeFilteredSample,IncludeParam)
    % Initialization array of valid rows
     ValidNumRows=[];
     % Extracting Start & Finish Points of Time Interval & modification to
     % TimeFormat
     % Extract quantity interval from StartTime
     QuantIntervals = size(IncludeParam{5,1}.StartTime);
     % Extract & converting Time Intervals Arrays to Serial Date Format (SDF)
     StartPointDoub=char(IncludeParam{5,1}.StartTime);
     StartPointsOfTime = string(IncludeParam{5,1}.StartTime);
     FinishPointsOfTime = string(IncludeParam{5,1}.FinishTime);
     LimitsOfTime = [StartPointsOfTime; FinishPointsOfTime];
     LimitsOfTimeSDF=rem(datenum(datetime(LimitsOfTime,'InputFormat','HHmmss')),1);
     % Converting StageThreeFilteredSample.Time to SDF-format
     TimeForFiltStr=datestr(StageThreeFilteredSample.Time,'HH:MM:SS');
     TimeInNum = rem(datenum(TimeForFiltStr,'HH:MM:SS'),1);
     % Time limits validation 
     for CurrTimeInterval=1:1:QuantIntervals(1,2)
         % Found Rows
         CurrValidNumRows = find(TimeInNum>=LimitsOfTimeSDF(1,CurrTimeInterval)&...
                                TimeInNum<=LimitsOfTimeSDF(2,CurrTimeInterval));...
         % Appending to ValidNumRows
         ValidNumRows=[ValidNumRows; CurrValidNumRows];
         
     end
     
         ValidNumRows = sort (ValidNumRows);
     % Extract filtered data from data of stage 1
     StageFourSample =  TimeInNum;%StageThreeFilteredSample(ValidNumRows,:);
    
     
     
     

     