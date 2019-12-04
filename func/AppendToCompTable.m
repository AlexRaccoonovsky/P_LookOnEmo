function CompTableAppend=AppendToCompTable(InitCellArray)
% Function for extract & appending parameters in individual columns
% PosEmo(Positive Emotions), NegEmo (Negative Emotions) of Complex Table

% String of full path to file
FullPatch=strcat(InitCellArray{1,1},InitCellArray{1,2});
% load Complex Table data
CompTable=load(FullPatch,'CompTable');
% Evaluating PosEmo 
CompTable.CompTable.PosEmo=CompTable.CompTable.HP-CompTable.CompTable.OP;
% Evaluating PosEmo (PerCent) relatively OP
CompTable.CompTable.PosEmoRel_PerCent=(CompTable.CompTable.PosEmo*100)./CompTable.CompTable.OP;
% Evaluating NegEmo 
CompTable.CompTable.NegEmo=CompTable.CompTable.OP-CompTable.CompTable.LP;
% Evaluating NegEmo (PerCent) relatively OP
CompTable.CompTable.NegEmoRel_PerCent=(CompTable.CompTable.NegEmo*100)./CompTable.CompTable.OP;
% Evaluating NegEmo (PerCent) relatively OP
% Creating column Weekday
CompTable.CompTable.Weekday=weekday(CompTable.CompTable.Date,'long');
% Result
CompTableAppend = CompTable.CompTable;

