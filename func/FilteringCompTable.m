function FilteredSample=FilteringCompTable(CompTableAppend,IncludeParam)
 StartPoint = IncludeParam{2,1}.StartDate(3);
 StartPointString=num2str(StartPoint);
 StartPointDTF = datetime(StartPointString,'InputFormat','yyyyMMdd');
 
 FinishPoint = IncludeParam{2,1}.FinishDate(3);
 FinishPointString=num2str(FinishPoint)
 FinishPointDTF = datetime(FinishPointString,'InputFormat','yyyyMMdd')
 
 tf = find(CompTableAppend.Date>=StartPointDTF & CompTableAppend.Date<=FinishPointDTF)
 FilteredSample= tf