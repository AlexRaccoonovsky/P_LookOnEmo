% Script of forming parameters for including sample  
%% Flag
IncludeParam{1,1}='Active';
%% Including Date in Sample
IncludeParam{2,1}.StartDate =  [20080604 20090605 20100915 20110915];
IncludeParam{2,1}.FinishDate = [20090604 20100914 20110914 20190914];
%% Including month day in a sample
IncludeParam{3,1}=[1:31];
%% Including week day in a sample
%["Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"];
%[   2         3         4            5         6         7        1    ];
%IncludeParam{4,1}=["Monday" "Tuesday" ];
IncludeParam{4,1}=[1:7];
%% Including Time in Sample
IncludeParam{5,1}.StartTime =  ["000000" "090000" "121500"];
IncludeParam{5,1}.FinishTime = ["084500" "120000" "234500"];
