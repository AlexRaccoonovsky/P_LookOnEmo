function FilterSampleCompTable=FilterSample(CompTableAppend,IncludeParam)
% function for filtering CompTable with using IncludeParam
%% Initialization parameters
% Size of CompTableAppend
SizeOfCompTable=size(CompTableAppend);
RowInCompTable=SizeOfCompTable(1,1);

%% Cycle Row-by-Row in CompTableAppend
for CurrentRow=1:1:RowInCompTable
  
    %% 1 stage filtering (by date interval (IncludeParam{2,1}))
     if (DateRangeIsValid(CompTableAppend(CurrentRow,:)))
         AddStringTo(FilterSampleCompTable);
     else
    end
        
    
end