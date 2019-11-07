% Script of forming parameters for including sample  
%% Flag
IncludeParam{1,1}='Active';
%% Including Date in Sample
IncludeParam{2,1}.StartDate =  [20100303 20120405 20151020];
IncludeParam{2,1}.FinishDate = [20110304 20120805 20171020];
%% Including month day in a sample
IncludeParam{3,1}=1:31;
%% Including week day in a sample
IncludeParam{4,1}=["Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"];
%% Including Time in Sample
IncludeParam{5,1}.StartTime =  [111500 163000 210000];
IncludeParam{5,1}.FinishDate = [123000 164500 213000];
