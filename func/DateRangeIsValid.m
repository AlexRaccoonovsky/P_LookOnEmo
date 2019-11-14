function ResultValidation=DateRangeIsValid(StringCompTable,IncludeParam)
% Extract & Testing DateIntervals
ArrayOfStartPoints=IncludeParam{2,1}.StartDate;
ArrayOfFinishPoints=IncludeParam{2,1}.FinishDate;
SizeStartPoints=size(ArrayOfStartPoints);
SizeFinishPoints=size(ArrayOfFinishPoints);
if(SizeStartPoints(1,2)==SizeFinishPoints(1,2))
    for (NumDateInterval=1:1:SizeStartPoints(1,2))
        NumDateInterval
        StringStartPoint=num2str(ArrayOfStartPoints(NumDateInterval));
        StringFinishPoint=num2str(ArrayOfFinishPoints(NumDateInterval));
        
        StartIntervalPoint=datetime(StringStartPoint,'InputFormat','yyyyMMdd','Format','yyyyMMdd');
        FinishIntervalPoint=datetime(StringFinishPoint,'InputFormat','yyyyMMdd','Format','yyyyMMdd');
        
        if (StringCompTable.Date>=StartIntervalPoint && StringCompTable.Date<= FinishIntervalPoint)
            ResultValidation = true
            return
            else
            ResultValidation = false
            
        end
    end
end    
% ff=num2str(ArrayOfStartPoints(1))
% ResultValidation= datetime(ff,'InputFormat','yyyyMMdd','Format','yyyyMMdd')