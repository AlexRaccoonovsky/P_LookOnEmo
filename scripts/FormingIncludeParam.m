% Script of forming parameters for including sample  
%% Flag
IncludeParam{1,1}='Active';
%% Including Date in Sample
IncludeParam{2,1}.StartDate =  [20090303 20120405 20151020];
IncludeParam{2,1}.FinishDate = [20110304 20140605 20181022];
%% Including month day in a sample
IncludeParam{3,1}=8:16;
%% Including week day in a sample
%["Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"];
%[   2         3         4            5         6         7        1    ];
%IncludeParam{4,1}=["Monday" "Tuesday" ];
IncludeParam{4,1}=[2 4 6];
%% Including Time in Sample
IncludeParam{5,1}.StartTime =  [111500 163000 210000];
IncludeParam{5,1}.FinishDate = [123000 164500 213000];
