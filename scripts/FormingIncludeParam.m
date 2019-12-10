% Script of forming parameters for including sample  
%% Flag
IncludeParam{1,1}='Active';
%% Including Date in Sample
IncludeParam{2,1}.StartDate =  [20150505 20170418 20190627];
IncludeParam{2,1}.FinishDate = [20160205 20181229 20190830];
%% Including month day in a sample
IncludeParam{3,1}=[1:31];
%% Including week day in a sample
%["Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"];
%[   2         3         4            5         6         7        1    ];
%IncludeParam{4,1}=["Monday" "Tuesday" ];
IncludeParam{4,1}=[6];
%% Including Time in Sample
IncludeParam{5,1}.StartTime =  ["110000" ];
IncludeParam{5,1}.FinishTime = ["124500" ];
%% Definition ranges for plotting (absoluting values).
%% Start point is included in range
IncludeParam{6,2}.StartPointsOfRanges=[0 11 21 26 51 101];
IncludeParam{6,2}.FinishPointsOfRanges=[10 20 25 50 100 1000];