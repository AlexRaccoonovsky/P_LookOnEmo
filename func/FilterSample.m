function FilteredSampleCompTable=FilterSample(CompTableAppend,IncludeParam)
% function for filtering CompTable with using IncludeParam
%% Initialization parameters
% Size of CompTableAppend
SizeOfCompTable=size(CompTableAppend);
RowInCompTable=SizeOfCompTable(1,1);
FilteredSampleCompTable=table();

%% Cycle Row-by-Row in CompTableAppend
for CurrentRow=1:1:RowInCompTable
    
    %% 1 stage filtering (by date interval (IncludeParam{2,1}))
    ResultValidation=DateRangeIsValid(CompTableAppend(CurrentRow,:),IncludeParam);
    %FilteredSampleCompTable=ResultValidation
    if (ResultValidation)
        NewString=CompTableAppend(CurrentRow,:)
        FilteredSampleCompTable=cat(1,FilteredSampleCompTable, NewString);
%     RowInSample=RowInSample+1
%     FilteredSampleCompTable=AddString
%     if (ResultValidation)
%          FilterSampleCompTable=NewString;
%          FilteredSampleCompTable=cat(1,FilteredSampleCompTable, NewString)
%     else
     end
%     
        
    
end